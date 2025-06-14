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

void ADC ::spiRead_handler(FwIndexType portNum, U16 sample) {
    // TODO
    // Forward the received sample through the output port if connected
    if (this->isConnected_readSample_OutputPort(0)) {
        this->readSample_out(0, sample);
        this->tlmWrite_ADC_Sample(sample);
    }
}

}  // namespace TestModule
