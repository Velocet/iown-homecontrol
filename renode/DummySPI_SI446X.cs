//
// Copyright (c) 2010-2021 Antmicro
//
//  This file is licensed under the MIT License.
//  Full license text is available in 'licenses/MIT.txt'.
//
using Antmicro.Renode.Logging;
using Antmicro.Renode.Peripherals.SPI;
using System.Collections.Generic;

namespace Antmicro.Renode.Peripherals.Mocks
{
    public class DummySPI_SI446X : ISPIPeripheral
    {
        public DummySPI_SI446X()
        {
            buffer = new Queue<byte>();
        }

        public void EnqueueValue(byte val)
        {
            buffer.Enqueue(val);
        }

        public void FinishTransmission()
        {
            idx = 0;
        }

        public void Reset()
        {
            buffer.Clear();
            idx = 0;
        }

        public byte Transmit(byte data)
        {
            this.Log(LogLevel.Debug, "Data received: 0x{0:X} (idx: {1})", data, idx);
            idx++;
            // Trying to answer
            if(data == 0x00) EnqueueValue(0x80); // Get SPI Status
            else EnqueueValue(data);

            if(buffer.Count == 0)
            {
                this.Log(LogLevel.Debug, "No data left in buffer, returning 0.");
                return 0;
            }
            return buffer.Dequeue();
        }

        private int idx;

        private readonly Queue<byte> buffer;
    }
}