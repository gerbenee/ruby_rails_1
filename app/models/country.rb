class Country
    include HTTParty

    default_options.update(verify: false) #SSL off
    base_uri 'https://restcountries.eu/rest/v2/'

    format :json

    def self.all
        countries = get("/all")

        #Replace borders country codes with country names
        #language within language

        countries.each do |country|
            country['borders'].map! do |country_code|
                countries.find { |country| country['alpha3Code'] == country_code}['name']
            end
            country['languages'].map! { |language| language['name']}
        end
        countries
    end
end