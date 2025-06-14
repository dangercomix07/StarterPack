// ======================================================================
// \title  SimSPI.cpp
// \author ameya
// \brief  cpp file for SimSPI component implementation class
// ======================================================================

#include "Components/SimSPI/SimSPI.hpp"

namespace TestModule {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

SimSPI ::SimSPI(const char* const compName) : SimSPIComponentBase(compName) {}

SimSPI ::~SimSPI() {}

void SimSPI::sendSample(U16 sample) {
    // Implementation of sending a sample
    this->sampleOut_out(0, sample);
    this->log_ACTIVITY_HI_SAMPLE(sample);
}  

}// namespace TestModule
