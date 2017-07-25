-------------------------------------------------------------------------------
-- MB_SPI_hdl_receive_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library hdl_receive_v1_00_a;
use hdl_receive_v1_00_a.all;

entity MB_SPI_hdl_receive_0_wrapper is
  port (
    IN0 : in std_logic_vector(31 downto 0);
    IN1 : in std_logic_vector(31 downto 0);
    IN2 : in std_logic_vector(31 downto 0);
    IN3 : in std_logic_vector(31 downto 0);
    IN4 : in std_logic_vector(31 downto 0);
    IN5 : in std_logic_vector(31 downto 0);
    IN6 : in std_logic_vector(31 downto 0);
    IN7 : in std_logic_vector(31 downto 0);
    IN8 : in std_logic_vector(31 downto 0);
    IN9 : in std_logic_vector(31 downto 0);
    IN10 : in std_logic_vector(31 downto 0);
    IN11 : in std_logic_vector(31 downto 0);
    IN12 : in std_logic_vector(31 downto 0);
    IN13 : in std_logic_vector(31 downto 0);
    IN14 : in std_logic_vector(31 downto 0);
    IN15 : in std_logic_vector(31 downto 0);
    IN16 : in std_logic_vector(31 downto 0);
    IN17 : in std_logic_vector(31 downto 0);
    IN18 : in std_logic_vector(31 downto 0);
    IN19 : in std_logic_vector(31 downto 0);
    IN20 : in std_logic_vector(31 downto 0);
    IN21 : in std_logic_vector(31 downto 0);
    IN22 : in std_logic_vector(31 downto 0);
    IN23 : in std_logic_vector(31 downto 0);
    IN24 : in std_logic_vector(31 downto 0);
    IN25 : in std_logic_vector(31 downto 0);
    IN26 : in std_logic_vector(31 downto 0);
    IN27 : in std_logic_vector(31 downto 0);
    IN28 : in std_logic_vector(31 downto 0);
    IN29 : in std_logic_vector(31 downto 0);
    IN30 : in std_logic_vector(31 downto 0);
    IN31 : in std_logic_vector(31 downto 0);
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
end MB_SPI_hdl_receive_0_wrapper;

architecture STRUCTURE of MB_SPI_hdl_receive_0_wrapper is

  component hdl_receive is
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
      IN0 : in std_logic_vector(31 downto 0);
      IN1 : in std_logic_vector(31 downto 0);
      IN2 : in std_logic_vector(31 downto 0);
      IN3 : in std_logic_vector(31 downto 0);
      IN4 : in std_logic_vector(31 downto 0);
      IN5 : in std_logic_vector(31 downto 0);
      IN6 : in std_logic_vector(31 downto 0);
      IN7 : in std_logic_vector(31 downto 0);
      IN8 : in std_logic_vector(31 downto 0);
      IN9 : in std_logic_vector(31 downto 0);
      IN10 : in std_logic_vector(31 downto 0);
      IN11 : in std_logic_vector(31 downto 0);
      IN12 : in std_logic_vector(31 downto 0);
      IN13 : in std_logic_vector(31 downto 0);
      IN14 : in std_logic_vector(31 downto 0);
      IN15 : in std_logic_vector(31 downto 0);
      IN16 : in std_logic_vector(31 downto 0);
      IN17 : in std_logic_vector(31 downto 0);
      IN18 : in std_logic_vector(31 downto 0);
      IN19 : in std_logic_vector(31 downto 0);
      IN20 : in std_logic_vector(31 downto 0);
      IN21 : in std_logic_vector(31 downto 0);
      IN22 : in std_logic_vector(31 downto 0);
      IN23 : in std_logic_vector(31 downto 0);
      IN24 : in std_logic_vector(31 downto 0);
      IN25 : in std_logic_vector(31 downto 0);
      IN26 : in std_logic_vector(31 downto 0);
      IN27 : in std_logic_vector(31 downto 0);
      IN28 : in std_logic_vector(31 downto 0);
      IN29 : in std_logic_vector(31 downto 0);
      IN30 : in std_logic_vector(31 downto 0);
      IN31 : in std_logic_vector(31 downto 0);
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

  hdl_receive_0 : hdl_receive
    generic map (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_MIN_SIZE => X"000001ff",
      C_USE_WSTRB => 0,
      C_DPHASE_TIMEOUT => 8,
      C_BASEADDR => X"7e220000",
      C_HIGHADDR => X"7e22ffff",
      C_FAMILY => "spartan6",
      C_NUM_REG => 32,
      C_NUM_MEM => 1,
      C_SLV_AWIDTH => 32,
      C_SLV_DWIDTH => 32
    )
    port map (
      IN0 => IN0,
      IN1 => IN1,
      IN2 => IN2,
      IN3 => IN3,
      IN4 => IN4,
      IN5 => IN5,
      IN6 => IN6,
      IN7 => IN7,
      IN8 => IN8,
      IN9 => IN9,
      IN10 => IN10,
      IN11 => IN11,
      IN12 => IN12,
      IN13 => IN13,
      IN14 => IN14,
      IN15 => IN15,
      IN16 => IN16,
      IN17 => IN17,
      IN18 => IN18,
      IN19 => IN19,
      IN20 => IN20,
      IN21 => IN21,
      IN22 => IN22,
      IN23 => IN23,
      IN24 => IN24,
      IN25 => IN25,
      IN26 => IN26,
      IN27 => IN27,
      IN28 => IN28,
      IN29 => IN29,
      IN30 => IN30,
      IN31 => IN31,
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

