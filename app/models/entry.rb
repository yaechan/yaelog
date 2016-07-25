class Entry < ActiveRecord::Base
  attr_accessible :title, :body, :category, :posted_at, :status

  STATUS_VALUES = %w(draft public)

  belongs_to :author, class_name: "Member", foreign_key: "member_id"
  has_and_belongs_to_many :categories

  validates :title, :body, :category, :posted_at, presence: true

  scope :common, where(status: "public")
  scope :time_over,
    ->{ now = Time.current
        where("posted_at <= ?", now) }
  scope :readable_for,
    ->(member) { common.time_over unless member.kind_of?(Member) }

  class << self
  	def status_text(status)
  	  I18n.t("activerecord.attributes.entry.status_#{status}")
  	end

  	def status_options
  	  STATUS_VALUES.map { |status| [status_text(status), status] }
  	end

  	def sidebar_entries(num = 5)
  	  order("posted_at DESC").limit(num)
  	end

    def sidebar_category
      joins(:categories).pluck("categories.name").uniq.sort
    end

    def form_category
      joins(:categories).select("categories.name").uniq.order("categories.name")
    end

    def search(query)
      rel = order("posted_at DESC")
      if query.present?
        rel = rel.where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
      end
      rel
    end

    def sidebar_archives
      Entry.all.group_by { |t| t.posted_at.beginning_of_month }
    end

    def find_by_prev(time)
      order("posted_at DESC").where("posted_at < ?", time).find(:first)
    end

    def find_by_next(time)
      order("posted_at ASC").where("posted_at > ?", time).find(:first)
    end
  end

  def destroy
    super
    self.categories.clear
    destroy_no_associated_categories
  end

  def attributes_category(joined_category_name)
    category_names = joined_category_name.split(",")
    self.categories.clear

    category_names.each do |category_name|
      next if category_name.blank?
      category = Category.find_by_name(category_name) || Category.create(name: category_name)
      self.categories << category
    end

    destroy_no_associated_categories
  end

  private
    def destroy_no_associated_categories
      Category.destroy_all("id NOT IN (SELECT DISTINCT(category_id) FROM categories_entries)")
    end
end
