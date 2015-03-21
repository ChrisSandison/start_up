class Api::V1::IdeasController < Api::BaseController

  def index
    @ideas = Idea.all

    start_time = params.has_key?("start") ? Time.at(params["start"].to_i) : Time.now - 7.days
    start_date = DateTime.new(start_time.year, start_time.month, start_time.day)

    end_time = params.has_key?("end") ? Time.at(params["end"].to_i) : Time.now + 1.day
    end_time = DateTime.new(end_time.year, end_time.month, end_time.day)

    k = params.has_key?("count") ? params[:count].to_i : 10

    @ideas = @ideas.where("created_at > ? and created_at < ?", start_time, end_time).sort_by(&:like_count).reverse[0..k]
  end

  def ideas_chart
    idea_count = Idea.count

    width = (params.has_key?("width") && params[:width].to_i <= 450 ) ? params[:width] : "450"
    height = (params.has_key?("height") && params[:height] && params[:height].to_i <= 200) ? params[:height] : "200"

    @industries = Industry.all
    @chart = "https://chart.googleapis.com/chart?" + "chs=#{width}x#{height}" + "&chd=t:#{@industries.map{ |industry| industry.ideas.count }.join(",")}" + "&cht=p3" + "&chl=#{@industries.map(&:name).join("|")}"
    binding.pry

    render json: { chart_type: "Pie", chart_url: @chart}
  end

  private

    def idea_params
      params.require(:amount, :start_date, :end_date)
    end

end
