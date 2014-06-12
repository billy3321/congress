# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Party.delete_all

filepath = Rails.root.join('db', 'g0v-lyparser', 'party.json')
parties = JSON.parse(File.read(filepath))
parties.each do |p|
  party = Party.new(p)
  party.id = p['id']
  party.save
end

ISO3166TW = {
  "CHA" => "彰化縣",
  "CYI" => "嘉義市",
  "CYQ" => "嘉義縣",
  "HSQ" => "新竹縣",
  "HSZ" => "新竹市",
  "HUA" => "花蓮縣",
  "ILA" => "宜蘭縣",
  "KEE" => "基隆市",
  "KHH" => "高雄市",
  "KHQ" => "高雄市",
  "MIA" => "苗栗縣",
  "NAN" => "南投縣",
  "PEN" => "澎湖縣",
  "PIF" => "屏東縣",
  "TAO" => "桃園縣",
  "TNN" => "台南市",
  "TNQ" => "台南市",
  "TPE" => "台北市",
  "TPQ" => "新北市",
  "TTT" => "台東縣",
  "TXG" => "台中市",
  "TXQ" => "台中市",
  "YUN" => "雲林縣",
  "JME" => "金門縣",
  "LJF" => "連江縣"
}

def constituency_parser(constituency)
  case (constituency[0]) 
  when 'proportional'
    return '全國不分區'
  when 'aborigine'
    return '山地原住民'
  when 'foreign'
    return '僑居國外國民'
  else
    if ISO3166TW[constituency[0]]
      if (constituency[1] == 0)
        result = ISO3166TW[constituency[0]]
      else
        result = ISO3166TW[constituency[0]] + '第' + constituency[1].to_s + '選區'
      end
    end
    return result
  end
end


Legislator.delete_all

filepath = Rails.root.join('db', 'g0v-lyparser', 'mly-8.json')
legislators = JSON.parse(File.read(filepath))
legislators.each do |l|
  legislator = Legislator.new()
  legislator.id = l['id']
  legislator.party_id = Party.where(abbreviation: l['party']).first.id
  legislator.name = l['name']
  legislator.image = '/legislators/160x214/' + l['id'].to_s + '.jpg'
  legislator.constituency = constituency_parser(l['constituency'])
  legislator.save
end