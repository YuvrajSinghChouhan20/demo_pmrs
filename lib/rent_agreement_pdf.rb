class RentAgreementPdf
  def initialize(owner, tenant, property)
    @owner = owner
    @tenant = tenant
    @property = property
    @pdf = Prawn::Document.new
  end

  def generate
    add_header
    add_parties
    add_property_details
    add_terms_and_conditions
    add_witnesses_and_signatures

    # Save the PDF to a file
    # file_path = Rails.root.join('tmp', 'rent_agreement.pdf')
    @pdf.render
  end

  private

  def add_header
    @pdf.text 'RENTAL AGREEMENT', size: 18, align: :center
    @pdf.move_down 10
    @pdf.text "This RENTAL AGREEMENT is executed at #{@property.city} on this #{Date.new.day} day of #{Date.new.month}, #{Date.today.year} by", align: :justify
    @pdf.text 'and between:', align: :justify
  end

  def add_parties
    @pdf.move_down 10
    add_party_details('OWNER', @owner)
    add_party_details('TENANT', @tenant)
  end

  def add_party_details(role, party)
    @pdf.text "#{role}:", style: :bold
    @pdf.text "#{party.first_name + party.last_name},"
    @pdf.text "S/o or D/o. #{party.first_name},"
    @pdf.text party.address
    @pdf.move_down 10
  end

  def add_property_details
    @pdf.text "WHEREAS the Owner is the absolute owner of the property situated at #{@property.address}, #{@property.city},#{@property.state}  as detailed in Annexure-I, hereinafter referred to as \"Demised Premises\".", align: :justify
    @pdf.move_down 10
    @pdf.text 'WHEREAS the Tenant has requested the Owner to grant Rent with respect to the Schedule Premises and the Owner has agreed to rent out to the Tenant the Property with two-wheeler and four-wheeler parking space in the ground floor for residential purposes only, on the following terms and conditions:', align: :justify
  end

  def add_terms_and_conditions
    @pdf.move_down 10
    @pdf.text 'NOW THIS DEED WITNESSETH AS FOLLOWS:', style: :bold

    @pdf.text "1. The rent in respect of the \“Demised Premises\” shall commence from #{Date.today} and shall be valid till #{Date.today + 11.months}. There after, the same may be extended further on mutual consent of both the parties.", align: :justify

    @pdf.move_down 5

    @pdf.text "2. That the Tenant shall pay to the Owner a monthly rent of Rs.(Amount of rent in Numbers),
    excluding electricity and water bill. The rent shall be paid on or before 7th day of each month
    without fail.", align: :justify

    @pdf.move_down 5

    @pdf.text "3. That the Tenant shall pay to the Owner a monthly maintenance charge of Rs.(Amount in
    Numbers) towards the maintenance of Generator & Elevator, Salaries towards guards, Charges
    for Electricity Maintenance for Common Areas, Charges towards cleaning of Common Areas
    and towards maintaining the lawn.", align: :justify

    @pdf.move_down 5

    @pdf.text "4. That the Tenant shall pay for the running cost of elevator and generator separately to the
    Owner.", align: :justify
    @pdf.move_down 5
    @pdf.text "5. That during the Rent period, in addition to the rental amount payable to the Owner, the Tenant
    shall pay for the use of electricity and water as per bills received from the authorities concerned
    directly. For all the dues of electricity bills and water bills till the date the possession of the
    premises is handed over by the Owner to the Tenant it is the responsibility of the Owner to pay
    and clear them according to the readings on the respective meters. At the time of handing over
    possession of the premises back to the Owner by Tenant, it is the responsibility of the Tenant to
    pay electricity & water bills, as presented by the Departments concerned according to the
    readings on the respective meters upto the date of vacation of the property.", align: :justify

    @pdf.move_down 5

    @pdf.text "6. The Tenant will pay to the Owner an interest-free refundable security deposit of Rs.(Amount
    in Numbers) vide cheque no (Cheque Number) dated (date of the cheque) at the time of signing
    the Rent Agreement. The said amount of the Security deposit shall be refunded by the Owner to
    the Tenant at the time of handing over possession of the demised premises by the Tenant upon
    expiry or sooner termination of this Rent after adjusting any dues (if any) or cost towards
    damages caused by the negligence of the Tenant or the person he is responsible for, normal wear
    & tear and damages due to act of god exempted. In case the Owner fails to refund the security
    deposit to the Tenant on early termination or expiry of the Rent agreement, the Tenant is entitled
    to hold possession of the Rented premises, without payment of rent and/or any other charges
    whatsoever, till such time the Owner refunds the security deposit to the Tenant. This is without
    prejudice and in addition to the other remedies available to the Tenant to recover the amount
    from the Owner.", align: :justify

    @pdf.move_down 5

    @pdf.text "7. That all the sanitary, electrical and other fittings and fixtures and appliances in the premises
    shall be handed over from the Owner to the Tenant in good working condition.", align: :justify

    @pdf.move_down 5

    @pdf.text "8. That the Tenant shall not sublet, assign or part with the demised premises in whole or part
    thereof to any person in any circumstances whatsoever and the same shall be used for the
    bonafide residential purposes only.", align: :justify

    @pdf.move_down 5

    @pdf.text "9. That the day-to-day minor repairs will be the responsibility for the Tenant at his/her own
    expense. However, any structural or major repairs, if so required, shall be carried out by the
    Owner", align: :justify


    @pdf.move_down 5

    @pdf.text "10. That no structural additions or alterations shall be made by the Tenant in the premises
    without the prior written consent of the Owner but the Tenant can install air-conditioners in the
    space provided and other electrical gadgets and make such changes for the purposes as may be
    necessary, at his own cost. On termination of the tenancy or earlier, the Tenant will be entitled to
    remove such equipment and restore the changes made, if any, to the original state."


    @pdf.move_down 5

    @pdf.text "11. That the Owner shall hold the right to visit in person or through his authorized agent(s),
    servants, workmen etc., to enter upon the demised premises for inspection (not exceeding once in
    a month) or to carry out repairs / construction, as and when required."


    @pdf.move_down 5

    @pdf.text "12. That the Tenant shall comply with all the rules and regulations of the local authority
    applicable to the demised premises. The premises will be used only for residential purposes of its
    employees, families and guests."


    @pdf.move_down 5

    @pdf.text "13. That the Owner shall pay for all taxes/cesses levied on the premises by the local or
    government authorities in the way of property tax for the premises and so on. Further, any other
    payment in the nature of subscription or periodical fee to the welfare association shall be paid by
    the Owner."


    @pdf.move_down 5

    @pdf.text "14. That the Owner will keep the Tenant free and harmless from any claims, proceedings,
    demands, or actions by others with respect to quiet possession of the premises."


    @pdf.move_down 5

    @pdf.text "15. That this Rent Agreement can be terminated before the expiry of this tenancy period by
    serving One month prior notice in writing by either party."


    @pdf.move_down 5

    @pdf.text "16. The Tenant shall maintain the Demised Premises in good and tenable condition and all the minor repairs such as leakage in the sanitary fittings water taps and electrical usage etc. shall be carried out by the Tenant. That it shall be the responsibility of the Tenant to hand over the vacant and peaceful possession of the demised premises on expiry of the Rent period, or on its early termination, as stated hereinabove in the same condition subject to natural wear and tear."


    @pdf.move_down 5

    @pdf.text "17. That in case, where the Premises are not vacated by the Tenant, at the termination of the Rentperiod, the Tenant will pay damages calculated at two times the rent for any period of occupation commencing from the expiry of the Rent period. The payment of damages as aforesaid will not preclude the Owner from initiating legal proceedings against the Tenant for recovering possession of premises or for any other purpose."


    @pdf.move_down 5

    @pdf.text "18. That both the parties shall observe and adhere to the terms and conditions contained
    hereinabove."


    @pdf.move_down 5

    @pdf.text "19. That the Tenant and Owners represent and warrant that they are fully empowered and
    competent to make this Rent. That both the parties have read over and understood all the contents
    of this agreement and have signed the same without any force or pressure from any side."


    @pdf.move_down 5

    @pdf.text "20. In case of any dispute to this agreement and the clauses herein, the same will be settled in the jurisdiction of the (city) civil courts."

    @pdf.move_down 5

    @pdf.text "21. That the Rent Agreement will be registered in front of the Registrar and the charges towards
    stamp duty, court fee & lawyer/coordinator will be equally borne by the Owner and Tenant."
  end

  def add_witnesses_and_signatures
    @pdf.move_down 30

    @pdf.text 'OWNER', style: :bold, align: :left
    @pdf.text "#{@property.user.first_name.capitalize + " " + @property.user.last_name }", align: :left
    @pdf.move_down 5
    @pdf.text '(Signature of the Owner)', align: :left
    @pdf.move_up 50
    @pdf.text 'TENANT', style: :bold, align: :right
    @pdf.text "#{@tenant.first_name.capitalize + " " + @tenant.last_name }", align: :right
    @pdf.move_down 5
    @pdf.text '(Signature of the Owner)', align: :right

  end
end





# class RentAgreementPdf
  # def initialize(tenant, property)
  #   @tenant = tenant
  #   @property = property
  #   @pdf = Prawn::Document.new
  #   @document_width = @pdf.bounds.width # width fo the document
  # end

  # def header
  #   @pdf.text "Rent Agreement", size: 18, align: :center
  #   @pdf.text "This agreement is made between #{@tenant.first_name} and #{@property.user.first_name}."
  # end


  # def mid_section
  #   # file = File.open('./agreement.txt')
  #   @pdf.text "#{@tenant}"
  # end
  # def generate
  #   header
  #   mid_section
  #   @pdf.render
  # end
