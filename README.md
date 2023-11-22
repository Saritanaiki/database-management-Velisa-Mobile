# database-management-Velisa-Mobile

VelisaDB serves as an all-encompassing mobile phone management system meticulously crafted to streamline the organization, retrieval, and analysis of fabricated customer data. This system integrates a well-constructed Entity-Relationship Diagram (ERD), relational schema, and SQL tables for effective data structuring. It's essential to clarify that all data within the system is entirely fictional, exclusively employed for showcasing proficiency in database creation and querying skills in a demonstrative context.

**Use Case**

Velisa, a mobile phone company, wishes to develop a database system to record its calls and billing information. 

Each outgoing call consists of a customer who rings a destination from a particular location (called a base station). The destination can be either another customer in the same network, a customer in another mobile network, a customer in a fixed line network or an international call. The customer making the call can be either in their home country (standard call) or making a call from another country (a roaming call). Every call has a duration and a price. Incoming calls are not part of the system and may be ignored. 

In addition, the mobile network needs to keep a track of where phones are to ensure each mobile phone is reachable. To do this each phone periodically sends out a beacon message which identifies it to the nearest base station. The time the phone was seen, and the signal strength are recorded. 

Each Velisa customer has a unique phone number, a sim card number and an account type which is either contract or pay as you go (PAYG). Contract-customers have an account number, customer name and address and the bank account details. Each contract-customer is a member of one of two banks: Vadarbank or Lukebank. Vadarbank stores a huge amount of information about its customers but for simplicity assume it is one multi-valued attribute called 'details'. Lukebank stores just a customer id. For PAYG customers no bank information is recorded; only the credit on the simcard is recorded.

**Tasks:**

•	Develop an Entity-Relationship model of the information requirements for the use case.

•	Translate the model into an equivalent relational schema. Specify all relation headings, indicating primary and foreign keys. 

•	Implement the entities from your relational schema in SQL

•	Execute 5 test cases for the SQL database technology and implement using queries and show the output.



## **Entity Relationsip Diagram**

The phone management system comprises six strong entities: customer, call, destination, basestation, beaconmessage, callcategory and contract. Each of these entities have associated attributes, the there exist a one-to-many relationship amongst the entities as shown in the entity relationship diagram (ERD) below.

![image](https://github.com/Saritanaiki/database-management-Velisa-Mobile/assets/103121228/4f2fe7bf-b43f-4e22-9653-b490db31220f)

## **The Relational Schema**

In order to convert the entity relational diagram to relational schema, the following steps were taken as shown below:

**Step 1:** Convert each regular (strong) entity to a relation.

**Regular (Strong) Entities**

•	Customer

•	Call

•	Destination

•	BaseStation

•	BeaconMessage

•	CallCategory

**Outcome**

•	Customer (phoneno, custID, firstname, lastname, simcardno, custAddress)

•	Call (callID, duration, price, timeofcall)

•	Destination (destinationID, destinationType, rate)

•	BaseStation (baseStID, baseStName)

•	BeaconMessage (msgID, timestamp, signalStrength)

•	CallCategory (catID, cat_name)

**Step 2:** Convert each weak entity into a relation with foreign keys to its identifying relations/entities (Weak entity cannot exist alone)

•	Not applicable for this model

**Step 3:** Convert one-to-one relationships into a UNIQUE foreign key reference from one relation to the other.

•	Not applicable for this model

**Step 4:** Convert one-to-many relationships into a foreign key reference from the N-side relation to the 1-side relation.

**One-to-many relationships**

•	Rings

•	ConnectsTo

•	initiates

•	Sends

•	Creates

•	IsType

**Outcome:**

•	Call (callID, duration, price, timeofcall, destinationID*, baseStID*, phoneno*, catID*)

•	BeaconMessage (msgID, timestamp, signalStrength, phoneno*, baseStID*)

**Step 5:** Convert many-to-many relationships into a new relation with foreign keys to the two participating entities.

•	Not applicable for this model

**Step 6:** Convert a multi-valued attribute into a relation with composite primary key consisting of the attribute value plus the primary key of the attribute's entity.

**Multi-valued attribute**

•	BS_location

**Outcome:**

•	BS_Location (baseStID*, postcode, city, county, country)

**Step 7:** Convert n-ary relationships by creating a new relation to represent the relationship and creating foreign keys that reference the related entities.

Not applicable for our model

**Step 8:** (Convert subclasses and superclasses by creating a relation for each subclass and superclass and place foreign keys in the relations corresponding to subclasses)

**Superclass**

•	Customer

•	CallCategory

**Subclass**

•	Contract_Customer

•	PAYG_Customer

•	Contract_Customer-Vadarbank

•	Contract_Customer-Lukebank

•	Roaming_Call

•	Standard_Call

**Outcome:**

•	ContractCustomer (phoneno*contractID, accountNo, startDate, sortcode, IBAN, Swiftcode, bankAddress)

•	PAYG_Customer (phoneno*credit)

•	Contract Customer-Vadarbank (phoneno*contractID, bankcustID, dateofBirth, occupation, creditScore)

•	Contract Customer-Lukebank (phoneno*contractID, backcustID)

•	CallCategory (catID, cat_name, partnetNetwork, markupRate, country)

**Final Conversion Outcome:**

•	Customer (phoneno, custID, firstname, lastname, simcardno, custAddress)

•	Destination (destinationID, destinationType, rate)

•	Call (callID, duration, price, timeofcall, destinationID*, baseStID*, phoneno*)

•	BaseStation (baseStID, baseStName)

•	BeaconMessage (msgID, timestamp, signalStrength, phoneno*, baseStID*)

•	BS_Location (baseStID*, postcode, city, county, country)

•	ContractCustomer (phoneno*contractID, accountNo, startDate, bankName, sortcode, IBAN, Swiftcode, bankAddress)

•	PAYGCustomer (phoneno*credit)

•	Contract Customer-Vadarbank (contractID,bankcustID, dateofBirth, occupation, creditScore)

•	Contract Customer-Lukebank (contractID, backcustID)

•	CallCategory (catID, cat_name, partnetNetwork, markupRate, country)

Below is the diagrammatic representation of the relational schema


![image](https://github.com/Saritanaiki/database-management-Velisa-Mobile/assets/103121228/8b07cc33-0ac1-43f4-bee7-d9d8c4b2b52c)


