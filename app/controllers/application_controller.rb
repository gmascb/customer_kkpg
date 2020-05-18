class ApplicationController < ActionController::API

  def pagination_meta(object)
    class_name = object.class.to_s.underscore.split("/").first
    {
        "#{class_name}": object, pages:{  current_page: object.current_page,
                                          next_page: object.next_page,
                                          prev_page: object.prev_page,
                                          total_pages: object.total_pages,
                                          total_count: object.total_count
                                       }
    }
  end

end
