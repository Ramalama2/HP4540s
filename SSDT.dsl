/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140210-00 [Feb 10 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000036A (874)
 *     Revision         0x01
 *     Checksum         0x00
 *     OEM ID           "APPLE "
 *     OEM Table ID     "CpuPm"
 *     OEM Revision     0x00014100 (82176)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140210 (538182160)
 */

DefinitionBlock ("ssdt.aml", "SSDT", 1, "APPLE ", "CpuPm", 0x00014100)
{
    External (\_PR.CPU0, DeviceObj)
    External (\_PR.CPU1, DeviceObj)
    External (\_PR.CPU2, DeviceObj)
    External (\_PR.CPU3, DeviceObj)

    Scope (\_PR.CPU0)
    {
        Method (_INI, 0, NotSerialized)
        {
            Store ("ssdtPRGen version....: 14.1 / Mac OS X 10.10 (14A389)", Debug)
            Store ("target processor.....: i3-3110M", Debug)
            Store ("running processor....: Intel(R) Core(TM) i3-3110M CPU @ 2.40GHz", Debug)
            Store ("baseFrequency........: 1200", Debug)
            Store ("frequency............: 2400", Debug)
            Store ("busFrequency.........: 100", Debug)
            Store ("logicalCPUs..........: 4", Debug)
            Store ("maximum TDP..........: 35", Debug)
            Store ("packageLength........: 13", Debug)
            Store ("turboStates..........: 0", Debug)
            Store ("maxTurboFrequency....: 2400", Debug)
        }

        Name (APLF, Zero)
        Name (APSN, Zero)
        Name (APSS, Package (0x0D)
        {
            /* High Frequency Modes (non-turbo) */
            Package (0x06) { 0x0960, 0x0088B8, 0x0A, 0x0A, 0x1800, 0x1800 },
            Package (0x06) { 0x08FC, 0x008189, 0x0A, 0x0A, 0x1700, 0x1700 },
            Package (0x06) { 0x0898, 0x007A7E, 0x0A, 0x0A, 0x1600, 0x1600 },
            Package (0x06) { 0x0834, 0x007395, 0x0A, 0x0A, 0x1500, 0x1500 },
            Package (0x06) { 0x07D0, 0x006CCF, 0x0A, 0x0A, 0x1400, 0x1400 },
            Package (0x06) { 0x076C, 0x00662C, 0x0A, 0x0A, 0x1300, 0x1300 },
            Package (0x06) { 0x0708, 0x005FAA, 0x0A, 0x0A, 0x1200, 0x1200 },
            Package (0x06) { 0x06A4, 0x00594A, 0x0A, 0x0A, 0x1100, 0x1100 },
            Package (0x06) { 0x0640, 0x00530C, 0x0A, 0x0A, 0x1000, 0x1000 },
            Package (0x06) { 0x05DC, 0x004CEE, 0x0A, 0x0A, 0x0F00, 0x0F00 },
            Package (0x06) { 0x0578, 0x0046F2, 0x0A, 0x0A, 0x0E00, 0x0E00 },
            Package (0x06) { 0x0514, 0x004116, 0x0A, 0x0A, 0x0D00, 0x0D00 },
            /* Low Frequency Mode */
            Package (0x06) { 0x04B0, 0x003B5A, 0x0A, 0x0A, 0x0C00, 0x0C00 }
        })

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method CPU0.ACST Called", Debug)
            Store ("CPU0 C-States    : 29", Debug)

            /* Low Power Modes for CPU0 */
            Return (Package (0x06)
            {
                One,
                0x04,
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000000, // Address
                            0x01,               // Access Size
                            )
                    },
                    One,
                    Zero,
                    0x03E8
                },

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000010, // Address
                            0x03,               // Access Size
                            )
                    },
                    0x03,
                    0xCD,
                    0x01F4
                },

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000020, // Address
                            0x03,               // Access Size
                            )
                    },
                    0x06,
                    0xF5,
                    0x015E
                },

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000030, // Address
                            0x03,               // Access Size
                            )
                    },
                    0x07,
                    0xF5,
                    0xC8
                }
            })
        }

        Method (_DSM, 4, NotSerialized)
        {
            Store ("Method CPU0._DSM Called", Debug)

            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                    0x03
                })
            }

            Return (Package (0x02)
            {
                "plugin-type",
                One
            })
        }
    }

    Scope (\_PR.CPU1)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _PR.CPU1.APSS Called", Debug)

            Return (\_PR.CPU0.APSS)
        }

        Method (ACST, 0, NotSerialized)
        {
            Store ("Method CPU1.ACST Called", Debug)
            Store ("CPU1 C-States    : 7", Debug)

            /* Low Power Modes for CPU1 */
            Return (Package (0x05)
            {
                One,
                0x03,
                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000000, // Address
                            0x01,               // Access Size
                            )
                    },
                    One,
                    0x03E8,
                    0x03E8
                },

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000010, // Address
                            0x03,               // Access Size
                            )
                    },
                    0x02,
                    0x94,
                    0x01F4
                },

                Package (0x04)
                {
                    ResourceTemplate ()
                    {
                        Register (FFixedHW,
                            0x01,               // Bit Width
                            0x02,               // Bit Offset
                            0x0000000000000030, // Address
                            0x03,               // Access Size
                            )
                    },
                    0x03,
                    0xC6,
                    0xC8
                }
            })
        }
    }

    Scope (\_PR.CPU2)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _PR.CPU2.APSS Called", Debug)

            Return (\_PR.CPU0.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_PR.CPU1.ACST ()) }
    }

    Scope (\_PR.CPU3)
    {
        Method (APSS, 0, NotSerialized)
        {
            Store ("Method _PR.CPU3.APSS Called", Debug)

            Return (\_PR.CPU0.APSS)
        }

        Method (ACST, 0, NotSerialized) { Return (\_PR.CPU1.ACST ()) }
    }
}
