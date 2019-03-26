module ApplicationHelper
  include Pagy::Frontend

  def link_to_add_player_fields(name, s, association)
    new_object = s.object.send(association).klass.new
    id = new_object.object_id
    fields = s.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", s: builder)
    end
    link_to(name, '#', class: "add_player_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
