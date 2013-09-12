ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    # div :class => "blank_slate_container", :id => "dashboard_default_message" do
    #   span :class => "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    columns do
      column do
        panel "Recently Published Posts" do
          ul do
            Post.published.limit(5).order('published_at DESC').map do |post|
              li link_to(post.title, edit_admin_post_path(post))
            end
          end
        end
      end

      column do
        panel "Unpublished Posts" do
          ul do
            Post.unpublished.limit(5).order('updated_at DESC').map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end
    end
  end # content
end
