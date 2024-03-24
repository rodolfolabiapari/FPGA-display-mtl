
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY mtl_controller IS
  GENERIC(
    input_clk : INTEGER := 33_000_000 --input clock speed from user logic in Hz
    );
  PORT(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic_vector(1 downto 0)


    dclk_in       : IN    STD_LOGIC;                    --system clock
    dclk_out      : OUT   STD_LOGIC;                    --system clock

    r             : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0); -- red bus
    g             : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0); -- green bus
    b             : OUT   STD_LOGIC_VECTOR(7 DOWNTO 0); -- blue bus

    hsd           : OUT   STD_LOGIC;                    -- horizontal
    vsd           : OUT   STD_LOGIC;                    -- vertical

    touch_i2c_scl : OUT   STD_LOGIC;
    touch_i2c_sda : INOUT STD_LOGIC;
    touch_int_n   : IN    STD_LOGIC;
END mtl_controller;

ARCHITECTURE mtl_controller_behav OF mtl_controller IS
	-- Build an enumerated type for the state machine
	type state_type is (st_reset, st_preprare_data, st_bound_h, st_bound_v, st_send_data);
	-- Register to hold the current state
	signal state   : state_type;

	constant signal h_period      : INTEGER  := 1056;
	constant signal h_pulse_width : INTEGER  := 30;
	constant signal h_back_porch  : INTEGER  := 16;
	constant signal h_front_porch : INTEGER  := 210;
	constant signal h_valid       : INTEGER  := 800;

	constant signal v_period      : INTEGER  := 525;
	constant signal v_pulse_width : INTEGER  := 13;
	constant signal v_back_porch  : INTEGER  := 10;
	constant signal v_front_porch : INTEGER  := 22;
	constant signal v_valid       : INTEGER  := 480;

	signal horizontal : INTEGER RANGE 0 TO 1056 := 0;
	signal vertical   : INTEGER RANGE 0 TO 525  := 0;

	component ram
		generic  (
			DATA_WIDTH : natural := 24;
			ADDR_WIDTH : natural := 20
		)
		port(
			clk   : in  std_logic;
			addr  : in  natural range 0 to 2**ADDR_WIDTH - 1;
			data  : in  std_logic_vector((DATA_WIDTH-1) downto 0);
			we    : in  std_logic := '1';
			q     : out std_logic_vector((DATA_WIDTH -1) downto 0)
		);
	signal ram_addr : natural range 0 to 2**ADDR_WIDTH - 1;
	signal ram_data : std_logic_vector((DATA_WIDTH-1) downto 0);
	signal ram_we   : std_logic := '1';
	signal ram_q    : std_logic_vector((DATA_WIDTH -1) downto 0);



begin
	pm_ram : ram port map (clk, ram_addr, ram_data, ram_we, ram_q);

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= st_reset;
		elsif (rising_edge(clk)) then
			case state is
				when st_reset=>
					state <= st_preprare_data;

				when st_vertical_signal_back_porch =>    -- VS Blanking
					if vertical >= v_back_porch then
						state <= st_vertical_signal_active;
					end if ;

				when st_vertical_signal_active =>        -- Active Area TVD
					if vertical >= v_back_porch + v_valid then
						state <= st_horizontal_signal_back_porch;
					end if ;

				when st_horizontal_signal_back_porch =>      -- HS Blanking
					if vertical >= v_back_porch then
						state <= st_vertical_signal_active;
					end if ;

				when st_horizontal_signal_active =>          -- Active Area THD
					if vertical >= v_back_porch + v_valid then
						state <= st_horizontal_signal_back_porch;
					end if ;
				when st_horizontal_signal_front_porch =>     -- HS Front Porch
					if vertical >= v_back_porch + v_valid then
						state <= st_horizontal_signal_back_porch;
					end if ;


				when st_vertical_signal_front_porch =>   -- VS Front Porch  7 22
					if vertical >= v_back_porch + v_valid then
						state <= st_horizontal_signal_back_porch;
					end if ;

				when s3 =>
					if input = '1' then
						state <= s0;
					else
						state <= s3;
					end if;
			end case;
		end if;
	end process;


	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when st_reset =>
				r(7 DOWNTO 0) <= others => '0';
				g(7 DOWNTO 0) <= others => '0';
				b(7 DOWNTO 0) <= others => '0';

				hsd           <= '0';
				vsd           <= '0';

				touch_i2c_sda <= '0';
				touch_i2c_scl <= '0';

				horizontal    <= 0;
				vertical      <= 0;

			when st_vertical_signal_back_porch =>    -- VS Blanking     23

			when st_vertical_signal_active =>        -- Active Area TVD 240

			when st_horizontal_signal_back_porch =>      -- HS Blanking      46
			when st_horizontal_signal_active =>          -- Active Area THD  800
			when st_horizontal_signal_front_porch =>     -- HS Front Porch   16  210 354


			when st_vertical_signal_front_porch =>   -- VS Front Porch  7 22 147




			when st_read_ram=>
				ram_addr <= (vertical * 525) + horizontal;
				ram_we <= '0';

			when st_write_bus=>
				r(7 DOWNTO 0) <= ram_q(23 DOWNTO 16);
				g(7 DOWNTO 0) <= ram_q(15 DOWNTO 8);
				b(7 DOWNTO 0) <= ram_q(7  DOWNTO 0);

			when st_send_data =>

			when s3 =>

		end case;
	end process;

end mtl_controller_behav;
