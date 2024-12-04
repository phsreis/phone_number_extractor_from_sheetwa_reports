class ExtractorController < ApplicationController
  require 'nokogiri'
  require 'csv'

  def index
    # Render the form view
  end

  def extract
    # Ensure files are uploaded
    if params[:files].blank?
      redirect_to root_path, alert: 'Please upload at least one file.'
      return
    end

    extracted_data = []

    # Process each uploaded file
    params[:files].each do |file|
      # Skip empty or invalid files
      next if file.blank? || !file.respond_to?(:read)

      begin
        # Parse the file and extract data
        data = extract_information(file)
        extracted_data.concat(data)
      rescue StandardError => e
        redirect_to root_path, alert: "Error processing file: #{file.respond_to?(:original_filename) ? file.original_filename : 'Unknown'}\n#{e.message}"
        return
      end
    end

    # If no valid files were processed
    if extracted_data.empty?
      redirect_to root_path, alert: 'No valid data extracted from the selected files.'
      return
    end

    # Generate the CSV file
    send_data(generate_csv(extracted_data), filename: "extracted_numbers.csv", type: "text/csv")
  end

  private

  def extract_information(file)
    data = []
    doc = Nokogiri::HTML(file.read)

    rows = doc.css('div[data-rowindex]')
    rows.each do |row|
      number_element = row.at_css('div[data-field="number"]')
      phone_number = number_element&.text&.strip

      status_element = row.at_css('div[data-field="status"]')
      status = status_element&.text&.strip

      data << { number: phone_number, status: status } if phone_number && status
    end

    data
  end

  def generate_csv(data)
    CSV.generate(headers: true) do |csv|
      csv << %w[Number Status]
      data.each { |entry| csv << [entry[:number], entry[:status]] }
    end
  end
end
