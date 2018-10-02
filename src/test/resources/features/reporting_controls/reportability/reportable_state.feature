@tag:reporting
Feature: Reportable state

  The reportable state is entered from Eligible when the transaction event is determined to be reportable for the state model.

  Reportable transactions may transition to:
  * Internal Error
  * Reportable by DB
  * Reportable by non-DB
  * Aquisition

  If DB is a reporting party of this transaction event - for some reporting obligations, this will always be the case for a reportable trade.
  {Scenario} Transactions reportable by DB

  If DB is not the reporting party of this transaction event, the transaction moves to `Reportable by non-DB`
  {Scenario} Transactions reportable by a non-DB

  @jurisdiction:mifid2
  Scenario: Transactions reportable by DB
  For example, for MiFID-II transaction reporting, this will always be the case

    Given the following transation is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | MIFID-2      | Reportable |
    When the transaction is processed
    Then the transaction should become:
      | Trade ID | Jurisdiction | State            |
      | 101      | MIFID-2      | Reportable by DB |

  @jurisdiction:bundesbank
  Scenario: Transactions reportable by a non-DB
    Given the following transation is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is processed
    Then the transaction should become:
      | Trade ID | Jurisdiction | State                |
      | 101      | Bundesbank   | Reportable by non-DB |

  @jurisdiction:bundesbank
  Scenario: An internal error is generated if the submissibility of a reportable transaction cannot be determined
    Given the following transation is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is rejected
    Then the transaction should become:
      | Trade ID | Jurisdiction | State          |
      | 101      | Bundesbank   | Internal Error |


  @jurisdiction:bundesbank
  Scenario: An internal error is generated if the system crashes
    Given the following transation is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | Bundesbank   | Reportable |
    When the transaction is discarded
    Then the transaction should become:
      | Trade ID | Jurisdiction | State          |
      | 101      | Bundesbank   | Internal Error |

  @Pending
  @jurisdiction:mifid2
  Scenario: Transactions are consistent with legacy application

    Given the following transaction is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | MIFID-2      | Reportable |
    When the transaction is processed
    Then the transaction should become:
      | Trade ID | Jurisdiction | State            |
      | 101      | MIFID-2      | Reportable by DB |

  @Manual
  @jurisdiction:mifid2
  Scenario: Transactions are consistent with regulations

    Given the following transaction is reportable
      | Trade ID | Jurisdiction | State      |
      | 101      | MIFID-2      | Reportable |
    When the transaction is processed
    Then the transaction should become:
      | Trade ID | Jurisdiction | State            |
      | 101      | MIFID-2      | Reportable by DB |

