class TypeaheadController < ApplicationController
  def index
    query = params[:query]
    head :bad_request and return if query.blank?
    searches = PgSearch.multisearch(query).limit(10)
    searches = searches.map do |search_object|
      search_object.searchable
    end.group_by { |search| search.class }

    # binding.pry
    render json: format_typeahead_data(searches)
  end

  private

  def format_typeahead_data data
    array = []
    data[Story].each do |json_object|
      array << {
        type:      "ticket",
        title:     json_object["link"],
        sub_title: json_object["desc"],
        indicator: json_object["point"]
      }
    end
    data[Room].each do |json_object|
      array << {
        type:      "room",
        title:     json_object["name"],
        sub_title: json_object["created_at"].strftime("%Y-%d-%m"),
        indicator: ""
      }
    end

    array
  end
end
