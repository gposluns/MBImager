-------------------------------------------------------------------------------
-- MB_SPI_hdl_control_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library hdl_control_v1_00_a;
use hdl_control_v1_00_a.all;

entity MB_SPI_hdl_control_0_wrapper is
  port (
    OUT0 : out std_logic_vector(31 downto 0);
    OUT1 : out std_logic_vector(31 downto 0);
    OUT2 : out std_logic_vector(31 downto 0);
    OUT3 : out std_logic_vector(31 downto 0);
    OUT4 : out std_logic_vector(31 downto 0);
    OUT5 : out std_logic_vector(31 downto 0);
    OUT6 : out std_logic_vector(31 downto 0);
    OUT7 : out std_logic_vector(31 downto 0);
    OUT8 : out std_logic_vector(31 downto 0);
    OUT9 : out std_logic_vector(31 downto 0);
    OUT10 : out std_logic_vector(31 downto 0);
    OUT11 : out std_logic_vector(31 downto 0);
    OUT12 : out std_logic_vector(31 downto 0);
    OUT13 : out std_logic_vector(31 downto 0);
    OUT14 : out std_logic_vector(31 downto 0);
    OUT15 : out std_logic_vector(31 downto 0);
    OUT16 : out std_logic_vector(31 downto 0);
    OUT17 : out std_logic_vector(31 downto 0);
    OUT18 : out std_logic_vector(31 downto 0);
    OUT19 : out std_logic_vector(31 downto 0);
    OUT20 : out std_logic_vector(31 downto 0);
    OUT21 : out std_logic_vector(31 downto 0);
    OUT22 : out std_logic_vector(31 downto 0);
    OUT23 : out std_logic_vector(31 downto 0);
    OUT24 : out std_logic_vector(31 downto 0);
    OUT25 : out std_logic_vector(31 downto 0);
    OUT26 : out std_logic_vector(31 downto 0);
    OUT27 : out std_logic_vector(31 downto 0);
    OUT28 : out std_logic_vector(31 downto 0);
    OUT29 : out std_logic_vector(31 downto 0);
    OUT30 : out std_logic_vector(31 downto 0);
    OUT31 : out std_logic_vector(31 downto 0);
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_RREADY : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_AWREADY : out std_logic
  );
end MB_SPI_hdl_control_0_wrapper;

architecture STRUCTURE of MB_SPI_hdl_control_0_wrapper is

  component hdl_control is
    generic (
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_MIN_SIZE : std_logic_vector;
      C_USE_WSTRB : INTEGER;
      C_DPHASE_TIMEOUT : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_FAMILY : STRING;
      C_NUM_REG : INTEGER;
      C_NUM_MEM : INTEGER;
      C_SLV_AWIDTH : INTEGER;
      C_SLV_DWIDTH : INTEGER
    );
    port (
      OUT0 : out std_logic_vector(31 downto 0);
      OUT1 : out std_logic_vector(31 downto 0);
      OUT2 : out std_logic_vector(31 downto 0);
      OUT3 : out std_logic_vector(31 downto 0);
      OUT4 : out std_logic_vector(31 downto 0);
      OUT5 : out std_logic_vector(31 downto 0);
      OUT6 : out std_logic_vector(31 downto 0);
      OUT7 : out std_logic_vector(31 downto 0);
      OUT8 : out std_logic_vector(31 downto 0);
      OUT9 : out std_logic_vector(31 downto 0);
      OUT10 : out std_logic_vector(31 downto 0);
      OUT11 : out std_logic_vector(31 downto 0);
      OUT12 : out std_logic_vector(31 downto 0);
      OUT13 : out std_logic_vector(31 downto 0);
      OUT14 : out std_logic_vector(31 downto 0);
      OUT15 : out std_logic_vector(31 downto 0);
      OUT16 : out std_logic_vector(31 downto 0);
      OUT17 : out std_logic_vector(31 downto 0);
      OUT18 : out std_logic_vector(31 downto 0);
      OUT19 : out std_logic_vector(31 downto 0);
      OUT20 : out std_logic_vector(31 downto 0);
      OUT21 : out std_logic_vector(31 downto 0);
      OUT22 : out std_logic_vector(31 downto 0);
      OUT23 : out std_logic_vector(31 downto 0);
      OUT24 : out std_logic_vector(31 downto 0);
      OUT25 : out std_logic_vector(31 downto 0);
      OUT26 : out std_logic_vector(31 downto 0);
      OUT27 : out std_logic_vector(31 downto 0);
      OUT28 : out std_logic_vector(31 downto 0);
      OUT29 : out std_logic_vector(31 downto 0);
      OUT30 : out std_logic_vector(31 downto 0);
      OUT31 : out std_logic_vector(31 downto 0);
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_AWREADY : out std_logic
    );
  end component;

begin

  hdl_control_0 : hdl_control
    generic map (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_MIN_SIZE => X"000001ff",
      C_USE_WSTRB => 0,
      C_DPHASE_TIMEOUT => 8,
      C_BASEADDR => X"7e200000",
      C_HIGHADDR => X"7e20ffff",
      C_FAMILY => "spartan6",
      C_NUM_REG => 32,
      C_NUM_MEM => 1,
      C_SLV_AWIDTH => 32,
      C_SLV_DWIDTH => 32
    )
    port map (
      OUT0 => OUT0,
      OUT1 => OUT1,
      OUT2 => OUT2,
      OUT3 => OUT3,
      OUT4 => OUT4,
      OUT5 => OUT5,
      OUT6 => OUT6,
      OUT7 => OUT7,
      OUT8 => OUT8,
      OUT9 => OUT9,
      OUT10 => OUT10,
      OUT11 => OUT11,
      OUT12 => OUT12,
      OUT13 => OUT13,
      OUT14 => OUT14,
      OUT15 => OUT15,
      OUT16 => OUT16,
      OUT17 => OUT17,
      OUT18 => OUT18,
      OUT19 => OUT19,
      OUT20 => OUT20,
      OUT21 => OUT21,
      OUT22 => OUT22,
      OUT23 => OUT23,
      OUT24 => OUT24,
      OUT25 => OUT25,
      OUT26 => OUT26,
      OUT27 => OUT27,
      OUT28 => OUT28,
      OUT29 => OUT29,
      OUT30 => OUT30,
      OUT31 => OUT31,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_AWREADY => S_AXI_AWREADY
    );

end architecture STRUCTURE;

