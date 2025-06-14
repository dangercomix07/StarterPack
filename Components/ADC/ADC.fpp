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

        @ Input port for receiving commands from SPI Driver
        sync input port spiRead: spiSample

        @ Output port: used by other components to get ADC sample
        output port readSample: spiSample

        @ Port to send telemetry data
        @ Telemetry port
        telemetry port tlmOut

        telemetry ADC_Sample: U16

        ###############################################################################
        # Standard AC Ports: Required for Channels, Events, Commands, and Parameters  #
        ###############################################################################
        @ Port for requesting the current time
        time get port timeCaller

       

    }
}