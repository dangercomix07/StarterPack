// ======================================================================
// \title  ADC.cpp
// \author ameya
// \brief  cpp file for ADC component implementation class
// ======================================================================

#include "Components/ADC/ADC.hpp"

namespace TestModule {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

ADC ::ADC(const char* const compName) : ADCComponentBase(compName) {}

ADC ::~ADC() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void ADC :: RequestSample_cmdHandler(U32 opCode, U32 cmdSeq, U8 channel) {
    this->spiRequest_out(0, channel);  // Request SPI driver
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}


void ADC ::spiSampleIn_handler(FwIndexType portNum, U8 channel, U16 value) {
    // TODO
    // F32 Gain = this->getGain_Param(0);  // Get the gain parameter
    // F32 Offset = this->getOffset_Param(0);  // Get the offset parameter

    this->log_ACTIVITY_HI_SampleReceived(channel, value);
    this->tlmWrite_LastSampledChannel(channel);
    this->tlmWrite_LastSampledValue(value);

    // // Forward the received sample through the output port if connected
    // if (this->isConnected_readSample_OutputPort(0)) {
    //     this->readSample_out(0, sample);
    //     this->tlmWrite_ADC_Sample(sample);
    // }
}

}  // namespace TestModule
