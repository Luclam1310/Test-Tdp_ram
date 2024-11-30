class tdpram_seq extends uvm_sequence#(tdpram_seq_item);
`uvm_object_utils(tdpram_seq)
tdpram_seq_item pkt;

	function new(string name = "tdpram_seq");
		super.new(name);
	endfunction
	
	task body();
		pkt = tdpram_seq_item::type_id::create("pkt");
		// khởi tạo một seq_item rỗng để sau đó có thể điền giá trị 
	repeat(10) // vòng lặp để tạo ra 10 seq_item
	begin
		
		start_item(pkt); 
		// đảm bảo rằng các seq_item không gởi đến driver quá nhanh,
		// khi driver đang thực hiện 1 giao dịch khác
		assert(pkt.randomize()); 
		// random các biến ngõ vào
		// tạo giá trị mới mỗi lần gửi vào DUT để kiểm tra nhiều trường hợp khác nhau.
		pkt.we = 0;
		pkt.print();
		finish_item(pkt); //
		// chờ đến khi driver hoàn tất xử lý seq_item hiện tại trước khi chuyển sang seq_item tiếp theo, 
		//giúp duy trì thứ tự và tính đồng bộ cho các seq_item trong chuỗi

		start_item(pkt);
		pkt.we = 1;
		pkt.print();
		finish_item(pkt);

		`uvm_info("SEQ","SEQUENCE TRANSACTIONS",UVM_NONE);
	end
	endtask
	
endclass