reload!


files = Dir["/Users/mdonahue/Desktop/banner/*"]

file_path = files.shuffle.last

user = User.create(email: "#{Time.now.to_i}@invalid.fake", password: 'aaaaa')

s = Shift.create(latitude: 32.708040528419374, longitude: -117.15956990601741, user: user)

photo = Photo.create!(kind: :banner, user: user)

s3 = Aws::S3::Resource.new(region:'us-east-1')
s3_object = s3.bucket("mytender-bucket").object(photo.s3_key)

s3_object.upload_file(File.new(file_path), content_type: 'image/jpeg')
files = Dir["/Users/mdonahue/Desktop/headshot/*"]

file_path = files.shuffle.last

photo = Photo.create!(kind: :headshot, user: user)
s3_object = s3.bucket("mytender-bucket").object(photo.s3_key)
s3_object.upload_file(File.new(file_path), content_type: 'image/jpeg')

# s3 = Aws::S3::Client.new
#   s3.put_object({
#     bucket: 'mytender-bucket',
#     key: photo.s3_key,
#     body: file_path
#   })


# content_type = 'application/pdf' if  @sms && content_type == 'application/octet-stream'


# content_disposition = @sms ? "inline" : "attachment;filename=#{filename}"
