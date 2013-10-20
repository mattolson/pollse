class ApplicationController < ActionController::Base

  helper_method :current_or_guest_user, :markdown_parser

  protect_from_forgery

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      if session[:guest_user_id]
        logging_in
        guest_user.destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  # find guest_user object associated with the current session,
  # creating one as needed
  def guest_user
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)
  rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user
  end

  def markdown_parser
    return @markdown_parser if @markdown_parser

    renderer = Redcarpet::Render::HTML.new(:hard_wrap => true, :filter_html => true, :no_links => true)
    options = {
      :autolink => false,
      :no_intra_emphasis => true,
      :lax_spacing => true,
      :strikethrough => true,
      :superscript => true
    }

    @markdown_parser = Redcarpet::Markdown.new(renderer, options)
  end

  private

  # called (once) when the user logs in, insert any code your application needs
  # to hand off from guest_user to current_user.
  def logging_in
    current_user.move_assets_from(guest_user)
  end

  def create_guest_user
    u = User.create(:email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

end
