class NavigationComponent < ViewComponent::Base
  def initialize(title:, left_link: nil, right_link: nil)
    @title = title
    @left_link = left_link
    @right_link = right_link
  end
end
