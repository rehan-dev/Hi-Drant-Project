class ReportsController < ApplicationController
  def index
  end

  def bill_report
  end

  def report_print
    bill_no = params[:bill_no]
    date_from = params[:date_from]
    date_to = params[:date_to]
    company_id = params[:company_id]
    current_date = Date.current
    if bill_no.present?
      bill_data = Billentry.where(secure: true, user_id: current_user.id ,id: bill_no) || []
    end

    if company_id.present?
      bill_data = Billentry.where(secure: true, user_id: current_user.id ,company_id: company_id) || []
    end

    if company_id.present? && date_from.present?
      bill_data = Billentry.where('secure = true AND user_id = ? AND company_id = ? AND billentries.current_date >= ? AND billentries.current_date <= ?',current_user.id, company_id ,date_from, current_date) || []
    end
    if company_id.present? && date_to.present?
      bill_data = Billentry.where('secure = true AND user_id = ? AND company_id = ? AND billentries.current_date <= ?',current_user.id, company_id , date_to) || []
    end
    if company_id.present? && date_from.present? && date_to.present?
      bill_data = Billentry.where('secure = true AND user_id = ? AND company_id = ? AND billentries.current_date >= ? AND billentries.current_date <= ?',current_user.id, company_id ,date_from, date_to) || []
    end

    if bill_data[0].nil?
      @bill_data = []
    else
      if bill_no.present?
        comp_data = Company.where(secure:true, user_id: current_user.id, id: bill_data[0].company_id).pluck(:company_name) || []
      else
        comp_data = Company.where(secure:true, user_id: current_user.id, id: company_id).pluck(:company_name) || []
      end
      @bill_data = bill_data
      @bill_name = comp_data
    end
  end

  # def report_data
  #   bill_no = params[:bill_no] || []
  #   bill_data = Billentry.where(secure: true, user_id: current_user.id ,id: bill_no)
  #   comp_data = Company.where(secure:true, user_id: current_user.id, id: bill_data[0].company_id).pluck(:company_name) || []
  #   bill_data = bill_data + comp_data
  #   if request.xhr?
  #     render :json => {
  #         :bill_entry => bill_data
  #     }
  #   end
  # end
end
