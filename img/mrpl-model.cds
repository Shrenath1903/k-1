namespace mrpl;

using {
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

entity EtenderMstr : managed {
    key PurchaseNo     : String(10)                                @title: 'Purchase Requisition'  @assert.unique;
        ID             : String;
        ProcessCode    : Association to ProcessCode default 'X'    @title: 'Process Code';
        DocumentStatus : Association to DocumentStatus default 'X' @title: 'Document Status';
        Date           : type of managed : createdAt               @title: 'Creation Date';
        User           : type of managed : createdBy               @title: 'Created By';

        @odata.etag
        UpdatedAt      : type of managed : modifiedAt              @title: 'Modified At';
        SubmitBy       : type of managed : modifiedBy              @title: 'Modified By';
        ApproveBy      : String                                    @title: 'Approved By';
        PendingWith    : String                                    @title: 'Pending With';
        WorkflowStatus : Association to WorkflowStatus default 'X' @title: 'Approval Status';

        tenderinput   : Composition of one TenderInp_Header
                             on tenderinput.PurchaseNo = $self;

};
entity ProcessCode : CodeList {
    key code        : String enum {
            new                       = 'X';
            CEG                       = 'A';
            PQC                       = 'B';
            Singel_Tender_Certificate = 'C';
            Austerity_App             = 'D';
            Check_list                = 'E';
            Doc_Upl                   = 'F';
            PQC_BEC                   = 'G';
            Tender_Doc                = 'H';
            Tender_Recp               = 'I';
            EMD                       = 'J';
            BID_Eval                  = 'K';
            Price_BID_OP              = 'L';
            CS                        = 'M';
            Negotiation               = 'N';
            Purchase_App              = 'Z';
        };
        criticality : Integer;
};

entity DocumentStatus : CodeList {
    key code        : String enum {
            NotCreated = 'X';
            Created    = 'C';
            Submitted  = 'S';
            Completed  = 'E';
        };
        criticality : Integer;
};

entity WorkflowStatus : CodeList {
    key code        : String enum {
            NotStarted = 'X';
            Rejected   = 'R';
            Pending    = 'P';
            Approved   = 'A';

        };
        criticality : Integer;
};

entity TenderInp_Header {
        PurchaseNo       : Association to EtenderMstr;
    key ID               : String @mandatory: true;
        Description       : String;
        T_Down_S_Date    : Date;
        T_Down_S_time    : Time;
        T_Down_E_Date    : Date;
        T_Down_E_time    : Time;
        Pre_Bid_Meet     : String;
        Bid_close_Date   : Date;
        Bid_Close_Time   : Time;
        Unprice_O_Date   : Date;
        Unprice_O_Time   : Time;
        Des_Tender       : String;
        Tender_Type      : String;
        Tender_Mode      : String;
        Bid_Type         : String;
        Tender_Number    : String;
        Bid_T_Close_Date : Date;
        Bid_T_Close_Time : Time;
        Bid_T_Open_Date  : Date;
        Bid_T_Open_Time  : Time;
        Prebid_C_Date    : Date;
        Prebid_C_Time    : Time;
        Venue            : String;
        EMD              : String;
        Duration         : String;
        MSE              : String;
        Item_Split       : Boolean;
        Relax_PQC        : String;
        Offer_Valid      : String;
        Price_Reduction  : String;
        Sec_Deposite     : String;
        Sec_App          : String;
        Defect_Liab      : String;
        Integrity        : String;
        Additiona_info   : String;
        Tech_Query_1     : String;
        Tech_Query_2     : String;
        Tech_Query_3     : String;
        Com_Query_1      : String;
        Com_Query_2      : String;
        Note             : String;

}


entity EmpF4Help @readonly 
  @searchable {
    key EmpCode  : String(8)   @title: 'Employee Code';
    EmpName      : String(40)  @title: 'Employee Name';
}

entity test {
  key EmpCode      : String(8) @mandatory
    @assert.range: [0, Infinity]             // Ensures non-negative values
    @title: 'Employee Code'
    @description: 'Personnel Number';

  EmpName          : String(40)
    @title: 'Employee Name'
    @description: 'Formatted Name of Employee or Applicant';

  EmpAuth          : String(40)
    @assert.format: 'uppercase'              // Ensures uppercase format
    @title: 'Employee Authority Level'
    @description: 'Name';

  Designation      : String(241)
    @assert.format: 'uppercase'              // Ensures uppercase format
    @title: 'Employee Designation'
    @description: 'Communication: Long Identification/Number';

  Email            : String(241)
    @assert.format: 'uppercase'              // Ensures uppercase format
    @title: 'Employee Email'
    @description: 'Communication: Long Identification/Number';
}
