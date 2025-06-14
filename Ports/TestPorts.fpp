module TestModule{
    @port for receiving commands from SPI Driver
    port spiSample(
        channel: U8 @< Which ADC channel this sample came from
        value: U16 @< Raw ADC value from SPI
    )
    @port for requesting SPI Driver to read sample from a channel
    port spiSampleRequest(
        channel: U8
    )
    @ Sample value from ADC to higher-level logic
    port adcSample(
        channel: U8 @< Which ADC channel this sample came from
        value: U16 @< Raw ADC value from SPI
    )
}