class Admin::CsvsController < ApplicationController
  def export_new
  end

  def export
    send_data(params[:table].classify.constantize.all.to_csv, {filename: params[:table]+".csv"})
  end

  def import_new
  end

  def import
    params[:table].classify.constantize.import(params[:file])
    
    redirect_to import_new_admin_csvs_path, notice: "table " + params[:table] + " successfully imported."
  end
end