#Lava Audio

Library for detecting audio volume.

We use our lava libs for checking video playback on our device tests.

## Dependencies

You will need to do the following to get set up:

* Install sox on your machine
* Ensure that the audio drivers are configured to enable sound input
* Plug an audio cable into the device you want to test
* Plug the other end into the microphone in on your machine
* Ensure the microphone input is set up as the default input

## Usage example

  sampler = Lava::AudioSampler.new
  10.times do
    p sampler.volume
  end

You should get a value back between 0 and 100. 0 indicates no noise, 100 is
the maximum volume for the microphone.
    
## License

Lava is available to everyone under the terms of the MIT open source licence. Take a look at the LICENSE file in the code.

Copyright (c) 2016 BBC

