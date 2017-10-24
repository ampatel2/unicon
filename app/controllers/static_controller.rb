class StaticController < ApplicationController


	def index
		
    # get list of all dimensions and units
    @dimensions = Dimension.distinct.order(:title).pluck(:title)
		@units = Unit.distinct.order(:title).pluck(:title)
	end

  def get_list

    #get params passed from website via JS AJAX
    @source = params[:source].to_i || 0
    @selected = params[:selected] || 0
    @startUnitValue = params[:startUnitValue]
    @endUnitValue = params[:endUnitValue]
    @dimensionValue = params[:dimensionValue]
    @inputValue = params[:inputValue].to_f

    @prev = @endUnitValue
    
    @updated_dimension = Unit.distinct.order(:dimension).where(title: @selected).pluck(:dimension)
    @updated_unit = Unit.distinct.order(:title).where(dimension: @updated_dimension).pluck(:title)

      #source 1 = startUnit Updated, 2 = endUnit Updated, 3 = dimension Updated
    if @source == 1

      @startUnitValue = @selected
      (@dimensionValue = @updated_dimension.first) unless (@updated_dimension.include? (@dimensionValue))
      (@endUnitValue = @updated_unit.first) unless (@updated_unit.include? (@endUnitValue))

    elsif @source == 2
      @endUnitValue = @selected
      
      (@startUnitValue = @updated_unit.first) unless (@updated_unit.include? (@startUnitValue))
      @updated_dimension = Unit.distinct.order(:dimension).where(title: @startUnitValue).pluck(:dimension)
      (@dimensionValue = @updated_dimension.first) unless (@updated_dimension.include? (@dimensionValue))

    elsif @source == 3
      @dimensionValue = @selected
      @updated_unit = Unit.distinct.order(:title).where(dimension: @dimensionValue).pluck(:title)
      (@startUnitValue = @updated_unit.first) unless (@updated_unit.include? (@startUnitValue))
      (@endUnitValue = @updated_unit.first) unless (@updated_unit.include? (@endUnitValue))

    end

    
      @numerator = Unit.where(title: @startUnitValue, dimension: @dimensionValue).limit(1).pluck(:anchor_value).first.to_f
      @denominator = Unit.where(title: @endUnitValue, dimension: @dimensionValue).limit(1).pluck(:anchor_value).first.to_f
      
      @converted = ""

      if ((@numerator > 0) && (@denominator > 0))
        @converted = ((@inputValue.to_f) * (@numerator.to_f) / (@denominator.to_f)).round(8)
      end
      
    
    respond_to do |format|
      format.html {redirect_to root_path}
      format.js
    end
  end
end