class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_attached_file :image,
      styles: { medium: "640x640#", thumb: "100x100#" },
      storage: :s3,
      url: ":s3_domain_url",
      path: "/:class/:attachment/:id_partition/:style/:filename",
      s3_region: ENV["S3_REGION"],
      s3_credentials: Proc.new{ |a| a.instance.s3_credentials }

      def s_3 credentials
        {
          bucket: ENV["S3_BUCKET_NAME"],
          access_key_id: ENV["S3_ACCESS_KEY_ID"],
          secret_access_key: ENV["S3_SECRET_ACCESS_KEY"],
          region: ENV["S3_REGION"]
        }
      end

       validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

      validates :user_id, presence: true
end
#{ content_type: ["image/jpg", "image/jpeg", "image/png"]}
#do_not_validate_attachment_file_type :image
