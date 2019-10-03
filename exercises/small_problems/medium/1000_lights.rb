# get int
# return array
#
# data structure
#   lights are hash
#     light number => boolean
#
# create lights hash
#   size is input size
#   values are false
# input times loop
#   initialize iteration number
#   loop through hash with index
#     if index + 1 % iteration + 1 == 0
#       flip switch
# output array
#   select hash keys where value is true

# get array
# return string
#
# lights is light if only one
# add commas once to 3 on or off
# add and before last number
#
# initialize lights on sting
# initialize lights off string
#
# method to produce string
#   initialize string
#   if size is 1
#     string is 'light x is '
#   else
#     iterate through array
#     if last
#       add num to string
#     if 2nd to last
#       add 'num, and '
#     else
#       add 'num, '
#   return string
# run for on and off
# return "#{on} on #{off} off"

def find_on_lights(lights_hash)
  lights_hash.select { |_, status| status }.keys
end

def find_off_lights(lights_hash)
  lights_hash.select { |_, status| !status }.keys
end

def flip_switches!(lights_hash)
  1.upto(lights_hash.size) do |count|
    lights_hash.each_with_index do |(light, _), index|
      lights_hash[light] = !lights_hash[light] if ((index + 1) % count).zero?
    end
  end
end

def list_string(lights)
  return "Light #{lights[0]} is" if lights.size == 1

  str = 'Lights '
  lights.each_with_index do |light_number, index|
    str << if index + 1 == lights.size
             "and #{light_number} are"
           elsif index + 1 == lights.size - 1
             "#{light_number} "
           else
             "#{light_number}, "
           end
  end

  str
end

def create_output_string(lights_hash)
  on_lights = find_on_lights(lights_hash)
  off_lights = find_off_lights(lights_hash)
  return 'No lights are on' if on_lights.empty?

  lights_on_string = list_string(on_lights) + ' on'
  lights_off_string = list_string(off_lights) + ' off'

  full_string = lights_on_string
  full_string << " and #{lights_off_string}" unless off_lights.empty?

  full_string
end

def flip_lights(input)
  lights_hash = {}
  input.times { |i| lights_hash[i + 1] = false }

  flip_switches!(lights_hash)

  create_output_string(lights_hash)
end

p flip_lights(5)
p flip_lights(10)
p flip_lights(0)
p flip_lights(1)
