// ======================================================================
// \title  SimSPI.cpp
// \author ameya
// \brief  cpp file for SimSPI component implementation class
// ======================================================================

#include "Components/SimSPI/SimSPI.hpp"
#include <cstdlib>

namespace TestModule {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

SimSPI ::SimSPI(const char* const compName) : SimSPIComponentBase(compName) {}

SimSPI ::~SimSPI() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void SimSPI ::sampleRequest_handler(FwIndexType portNum, U8 channel) {
    // TODO
    // Simulate a 12-bit ADC value (0–4095)
    //U16 fakeSample = static_cast<U16>(rand() % 4096);

    U16 fakeSample = 1234;  // Fixed value for testing purposes
    // Send to ADC
    this->sampleOut_out(0, channel, fakeSample);

    // Log event for visibility
    this->log_ACTIVITY_HI_SampleSent(channel, fakeSample);
}

// ----------------------------------------------------------------------
// Inject a sample request directly into the handler
void SimSPI::injectSampleRequest(U8 channel, U16 sample) {
    if (this->isConnected_sampleOut_OutputPort(0)) {
        this->sampleOut_out(0, channel, sample);
    }
}
// ----------------------------------------------------------------------

}  // namespace TestModule
