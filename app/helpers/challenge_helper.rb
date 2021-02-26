module ChallengeHelper
def tick
  #     <% tags_arr = [] %>
  # <% Tag.all.each do |tag| %>
  #     <% tags_arr.push(tag.tag_name) %>
  # <% end %>

  tags_arr = []
  Tag.all.each do |tag|
    tags_arr.push(tag.tag_name)
  end
  tags_arr
end
end
