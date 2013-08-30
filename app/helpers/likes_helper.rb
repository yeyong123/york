module LikesHelper

	def like_link_for(target)
		link_to t("likes.like"), like_path(resource_name: target.class, resource_id: target.id), method: :post, class: "btn btn-success"
	end

	def unlike_link_for(target)
		link_to t("likes.unlike"), like_path(resource_name: target.class, resource_id: target.id), method: :delete, class: "btn btn-mini"
	end
end
