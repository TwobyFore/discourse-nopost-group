# name: discourse-nopost-group
# about: setup groups that can't create posts
# authors: Vairix

after_initialize do
  load File.expand_path("../controllers/extended_post_controller.rb", __FILE__)
end
