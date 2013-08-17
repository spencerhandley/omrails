class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { thumb: "150x150>"}

	attr_accessible :description, :image, :image_remote_url

	validates :description, presence: true
	validates :user_id, presence: true
	validates_attachment :image, presence: true,
								content_type: { content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']},
								size: {less_than: 5.megabytes}
	def image_remote_url=(url_value)
		self.image = URI.parse(url_value) unless url_value.blank?
		super
	end
end
