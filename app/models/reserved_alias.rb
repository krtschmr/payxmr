class ReservedAlias
  BLOCKED = %W(tinytim moneromoon)

  def self.includes?(str)
    BLOCKED.include?(str)
  end
end
