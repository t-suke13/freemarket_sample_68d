FactoryBot.define do
  factory :item_image do
    url   {Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/logo.png'))}
    item
  end
end