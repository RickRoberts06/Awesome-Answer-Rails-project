#This is our mode
class Question < ActiveRecord::Base

  #adding validation in here ensures that the records meets Those
  #criteria before saving / creating / updating. For instance
  #the record will not insert in the database in here if the title
  #is not present. Passing a Hash to the validation key overrides
  #the default values. So in here the message for presence validation#will
  #be "must be provided" instead of "can't be blank"
  validates :title, presence: {message: "must be provided"},
                    uniqueness: true,
                    length: {minimum: 5}

  validates :view_count, numericality: {greater_than_or_equal_to: 0}

#this validate uniqueness of the body to the title
  validates :body, uniqueness: {scope: :title}

  validate :no_monkey

  after_initialize :set_defaults
  before_save :capitalize


#This will give the 3 last results
  scope :recent_three, lambda{ order("updated_at DESC").limit(3)}
  #Can be written as this "above"
  # def self.recent_three
  #   order("updated_at DESC").limit(3)

  def self.search(term)
    #Vulnerable to Posqul string interpolation
    # self.where("body ILIKE '%#{term}%' OR title ILIKE '%#{term}%'")
    where("body ILIKE ? or title ILIKE ?", "%#{term}%' ,'%#{term}%'")

  end
  # end

  private
    def no_monkey
      if title.present? && title.include?("monkey")
      #to make the record invalid we just attach an error to the proper
      #filed and that will make the record invalid
      errors.add(title: "Can't have a monkey")
      end
  end

  def set_defaults
    self.view_count ||= 0
  end

  def capitalize
    self.title.capitalize!
  end


end
