class ArchivesController < ApplicationController
  def index
    @months = Post.find_all_grouped_by_month
    # put "months: #{months.inspect}"
  end
end
