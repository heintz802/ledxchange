# Handles ingestion of items from spreadsheets
module ProductIngestion
  include ActionView::Helpers::NumberHelper
  # Denotes a situation where the spreadsheet could not be processed
  class SpreadsheetError < StandardError; end

  # TODO: This will be determined by admin user
  FIRST_ROW = 5

  # TODO: This will be determined by admin user when he uploads file
  COLUMNS = {
      model:                    'B',
      product_id:               'C',
      description:              'E',
      power:                    'I',
      voltage:                  'J',
      beam_angle:               'K',
      cct:                      'L',
      lumens:                   'M',
      cbcp:                     'N',
      efficacy:                 'O',
      equivalent:               'P',
      energy_star_status:       'Q',
      reference:                'R'
  }

  # Returns a roo spreadsheet object to handle the given file
  def self.spreadsheet_for(file)
    raise SpreadsheetError unless file.file.exists?
    spreadsheet = Roo::Excelx.new file.path
    spreadsheet.default_sheet = spreadsheet.sheets.first

    return spreadsheet
  end

  def self.read_excel(file, manufacturer = nil, options = {})
    begin
      ss = spreadsheet_for(file)
    rescue SpreadsheetError => e
      return false
    end

    columns = options[:mapping] || COLUMNS
    first_row = options[:first_row] || FIRST_ROW
    last_row = first_row + 5 # ss.last_row
    count = 0

    first_row.upto last_row do |row|
      model = ss.cell(row, columns[:model]).to_s
      product_id = ss.cell(row, columns[:product_id]).to_i
      description = ss.cell(row, columns[:description]).to_s
      power = ss.cell(row, columns[:power]).to_f
      voltage_min = ss.cell(row, columns[:voltage]).to_s.split(' ').first.to_i
      beam_angle = ss.cell(row, columns[:beam_angle]).to_i
      cct = ss.cell(row, columns[:cct]).to_i
      lumens = ss.cell(row, columns[:lumens]).to_i
      cbcp = ss.cell(row, columns[:cbcp]).to_i
      efficacy = ss.cell(row, columns[:efficacy]).to_i
      equivalent = ss.cell(row, columns[:equivalent]).to_i
      energy_star_status = ss.cell(row, columns[:energy_star_status]).to_s
      reference = ss.cell(row, columns[:reference]).to_s
      # ...

      product = Product.new(
        model: model,
        product_id: product_id,
        description: description,
        power: power,
        voltage_min: voltage_min,
        beam_angle: beam_angle,
        cct: cct,
        lumens: lumens,
        cbcp: cbcp,
        efficacy: efficacy,
        equivalent: equivalent,
        energy_star_status: energy_star_status,
        reference: reference
      )
      product.save

      count += 1
    end

    count
  end
end