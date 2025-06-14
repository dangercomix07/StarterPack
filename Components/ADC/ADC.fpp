module TestModule {
    @ ADC Device Driver
    passive component ADC {

        ##############################################################################
        #### Uncomment the following examples to start customizing your component ####
        ##############################################################################

        # @ Example async command
        # async command COMMAND_NAME(param_name: U32)

        # @ Example telemetry counter
        # telemetry ExampleCounter: U64

        # @ Example event
        # event ExampleStateEvent(example_state: Fw.On) severity activity high id 0 format "State set to {}"

        # @ Example port: receiving calls from the rate group
        # sync input port run: Svc.Sched

        # @ Example parameter
        # param PARAMETER_NAME: U32

        @ Request sample on a given channel (command from app logic)
        sync command RequestSample(channel: U8)

        @ Output port to request SPI driver to read sample from a channel
        output port spiRequest: spiSampleRequest

        @ Input port to receive the result of SPI sample read
        sync input port spiSampleIn: spiSample

        @ Output port: used by other components to get ADC sample
        output port sampleOut: adcSample

        @ Port to send telemetry data
        @ Telemetry port
        telemetry port tlmOut

        @ Telemetry for last sampled value (optional)
        telemetry LastSampledChannel: U8
        telemetry LastSampledValue: U16

        @ Parameter for calibration scaling
        param Gain: F32 default 1.0
        param Offset: F32 default 0.0

        @ Event for channel sampling
        event SampleReceived(channel: U8, value: U16) severity activity high id 0 format "Sample received: ch {} = {}"

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

        @ Command receive
        command recv port cmdIn

        @ Command registration
        command reg port cmdRegOut

        @ Command response
        command resp port cmdResponseOut

        @ Parameter get
        param get port prmGetOut

        @ Parameter set
        param set port prmSetOut

        @ Event
        event port eventOut
        
        @ Text event
        text event port textEventOut

       

    }
}