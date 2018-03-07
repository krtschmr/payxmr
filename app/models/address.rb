class Address < ApplicationRecord

  validates :coin, :alias, :address, :uuid, :secret, presence: true
  validates :coin, inclusion: { in: %w(xmr) }
  validates_format_of :alias, with: /\A[a-zA-z0-9\.]{3,}\z/i #a.Z.1337
  validates :alias, uniqueness: { scope: :coin, message: "already taken" }
  validates :uuid, :secret, uniqueness: true
  validate :correct_address_format
  validate :non_reserved_alias, on: :create

  after_initialize {
    self.coin ||= :xmr
    self.uuid ||=  generate_uuid
    self.secret ||=  generate_secret
  }


  def dns_hash
    {
      name: "#{self.alias}.moneropay.com",
      TTL: 60,
      Type: "TXT",
      "TXT Data": txt_data
    }
  end

  def txt_data
    "oa1:#{coin} recipient_address=#{address}; recipient_name=#{self.alias} via moneropay.com\; tx_description=#{self.alias}\;"
  end

  private

  def non_reserved_alias
    self.errors.add(:alias, :already_taken) if ReservedAlias.includes?(self.alias)
  end

  def correct_address_format
    # TODO
    # check if address has correct format
    # self.errors.add(:address, :invalid_format)
  end

  def generate_uuid
    while str = random_string
      return str unless Address.find_by(uuid: str)
    end
  end

  def generate_secret
    while str = random_string
      return str unless Address.find_by(secret: str)
    end
  end

  def random_string
    SecureRandom.uuid.split("-")[0..2].join()
  end
end
