require "estimate_distance"
require "rest-client"
require "json"

module EstimateDistance
  EARTH_RADIUS = 6378137.0 #地球半径
  PI = Math::PI

  # def self.real_address(real_address)
  #   [real_address.city.try(:name), real_address.district.try(:name), real_address.address].compact.join
  # end

  def self.location_address_info(address, ak)
    if ak == ''
      params = {address: address, output: 'json', ak: 'dAYeNt1licEwUDKoyeNBskBQjHRKDDmb'}
    else
      params = {address: address, output: 'json', ak: ak}
    end
    request_info(params)
  end

  def self.request_info(params)
    begin
      result = RestClient.get('http://api.map.baidu.com/geocoder/v2/', params: params)
      JSON(result)
    rescue Exception=> e
      return false
    end
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

  def self.direct_calculate_distance(former_address, latter_address, ak='')
    former_result = location_address_info(former_address, ak)
    latter_result = location_address_info(latter_address, ak)

    if former_result['status'] == 0 && latter_result['status'] == 0
      lat1 = former_result['result']['location']['lat']
      lng1 = former_result['result']['location']['lng']

      lat2 = latter_result['result']['location']['lat']
      lng2 = latter_result['result']['location']['lng']
      circle_distance(lat1, lng1, lat2, lng2)
    else
      return { status: -1 ,message: 'ak有误或超出调用次数'}
    end
  end

end
