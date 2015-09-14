PostsController.class_eval do

  before_action :check_user_group, only: [:create]

  class CantCreatePost < StandardError; end

  def check_user_group
    setting = SiteSetting.find_by(name: "cant_create_post_group")
    unless current_user.groups.where(name: setting.value).empty?
      raise CantCreatePost
    end
  end

  rescue_from CantCreatePost do
    render_json_error "Oops. It looks like you were trying to create a post
                       from your brokerage account. In order for likes to count
                       towards your leaderboard status, you’ll need to post from
                       your Individual account. Please sign out and sign back in
                       with your Individual account credentials.", type: :cant_create_post, status: 405
  end

end
