class OmnicalcController < ApplicationController
  def homepage
    render({ :template => "omnicalc_templates/square_new"})
  end 

  def square_new
    render({ :template => "omnicalc_templates/square_new"})
  end 

  def square_results
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** 2

    render({ :template => "omnicalc_templates/square_results"})
  end

  def square_root_new
    render({ :template => "omnicalc_templates/square_root_new"})
  end 

  def square_root_results
    @the_num = params.fetch("users_number").to_f
    @the_result = @the_num ** (0.5)

    render({ :template => "omnicalc_templates/square_root_results"})
  end

  def payment_new
    render({ :template => "omnicalc_templates/payment_new"})
  end 

  def payment_results
    apr = (params.fetch("apr").to_f)/ 100
    times_apr = apr * 100 
    @rounded_apr = times_apr.to_fs(:percentage, { :precision => 4} )
    @num_of_years = params.fetch("num_of_years").to_i 
    @num_of_months = @num_of_years * 12
    principal_params = params.fetch("principal").to_f
    @principal = principal_params
    @principal_currency = principal_params.to_fs(:currency, { :precision => 2 })


    monthly_interest_rate = apr / 12
    denominator = 1 - (1 + monthly_interest_rate) ** -@num_of_months

    monthly_payment = (monthly_interest_rate * @principal) / denominator

    @payment = monthly_payment.to_fs(:currency, { :precision => 2 })

    render({ :template => "omnicalc_templates/payment_results"})
  end

  def random_new
    render({ :template => "omnicalc_templates/random_new"})
  end 

  def random_results
    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f
    random_float = rand(@min..@max)
    @random_num = random_float.round(15)

    render({ :template => "omnicalc_templates/random_results"})
  end

end 
