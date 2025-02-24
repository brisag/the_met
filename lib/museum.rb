class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def select_interested_patrons(exhibit)
  @patrons.select do |patron|
    patron.interests.include?(exhibit.name)
  end
end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      hash[exhibit] = select_interested_patrons(exhibit)
    end
    hash
  end

  def ticket_lottery_contestants(exhibit)
    patrons_by_exhibit_interest[exhibit].select do |patron|
      patron.spending_money <= exhibit.cost
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit).empty?
      nil
    else
      ticket_lottery_contestants(exhibit).sample
    end
  end

  def announce_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit).empty?
      "No winners for this lottery"
    else
      "#{draw_lottery_winner(exhibit).name} has won the #{exhibit.name} exhibit lottery"
    end
  end
end
