require "estimate_distance"
require "rest-client"
require "json"

module EstimateDistance
  EARTH_RADIUS = 6378137.0 #地球半径
  PI = Math::PI

  # def self.real_address(real_address)
  #   [real_address.city.try(:name), real_address.district.try(:name), real_address.address].compact.join
  # end

  def self.location_address_info(address)
    params = {address: address, output: 'json', ak: 'dAYeNt1licEwUDKoyeNBskBQjHRKDDmb'}
    result = RestClient.get('http://api.map.baidu.com/geocoder/v2/', params: params)
    data = JSON(result)
    data['result']['location']
  rescue
    {}
  end

  def self.get_rad(d)
    return d.to_f*PI/180.0
  end

  def self.circle_distance(lat1, lng1, lat2, lng2)
    lat1, lng1, lat2, lng2 = [lat1, lng1, lat2, lng2].map(&:to_f)
    radLat1 = get_rad(lat1)
    radLat2 = get_rad(lat2)
    a = radLat1 - radLat2
    b = get_rad(lng1) - get_rad(lng2)
    s = 2*Math.asin(Math.sqrt(Math.sin(a/2)**2 + Math.cos(radLat1)*Math.cos(radLat2)*Math.sin(b/2)**2))
    s = s*EARTH_RADIUS
    return (s/1000).round(2)
  end

  # def self.calculate_distance(former_address, latter_address)
  #   shop_detail_address = real_address(former_address)
  #   shop_result = location_address_info(shop_detail_address)
  #   puts shop_result
  #   lat1 = shop_result['lat']
  #   lng1 = shop_result['lng']
  #   user_result = location_address_info(latter_address)
  #   lat2 = user_result['lat']
  #   lng2 = user_result['lng']
  #   distance = get_great_circle_distance(lat1, lng1, lat2, lng2)
  #   distance
  # end

  def self.direct_calculate_distance(former_address, latter_address)
    former_result = location_address_info(former_address)
    lat1 = former_result['lat']
    lng1 = former_result['lng']
    latter_result = location_address_info(latter_address)
    lat2 = latter_result['lat']
    lng2 = latter_result['lng']
    distance = circle_distance(lat1, lng1, lat2, lng2)
    distance
  end
end
