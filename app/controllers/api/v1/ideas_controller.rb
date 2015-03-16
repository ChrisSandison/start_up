class Api::V1::IdeasController < Api::BaseController

  def index
    @ideas = Idea.all

    start_time = Time.at(params["start"].to_i)
    start_date = DateTime.new(start_time.year, start_time.month, start_time.day)

    end_time = Time.at(params["end"].to_i)
    end_time = DateTime.new(end_time.year, end_time.month, end_time.day)

    k = params.has_key?("count") ? params[:count].to_i : @ideas.count - 1

    @ideas = @ideas.where("created_at > ? and created_at < ?", start_time, end_time).sort_by(&:like_count).reverse[0..k]
  end

  def ideas_chart
    idea_count = Idea.count

    size = params.has_key?("size") ? params[:size] : "700x600"

    @industries = Industry.all
    @chart = Gchart.pie(labels: @industries.map(&:name), data: @industries.map { |industry| industry.ideas.count }, size: size)

    render json: { chart_type: "Pie", chart_url: @chart}
  end

  private

    def idea_params
      params.require(:amount, :start_date, :end_date)
    end

    def query_params
      # this assumes that an album belongs to an artist and has an :artist_id
      # allowing us to filter by this
      
    end

    def set_resource

    end

end
