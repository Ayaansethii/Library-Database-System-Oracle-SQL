### Assignment 2

**Concepts Utilized:**

- **Rectangles:**
    - **Single Rectangle:** Used for regular entities (Book, Author, Genre, Borrower, Administrator, User).
    - **Double Rectangle:** Used for weak entities (Loan).
- **Ovals:**
    - **Simple Oval:** For simple attributes (e.g., Title, Pages).
    - **Composite Oval:** For composite attributes (e.g., Name with sub-attributes First Name, Last Name).
    - **Dashed Oval:** For derived attributes (e.g., Age derived from Date of Birth in Author).
    - **Dashed Underlined Oval:** For partial key attributes of weak entities (e.g., Loan Number in Loan). A partial key attribute is a group of characteristics that can identify some, but not all, of the items in a collection. Think of it like a library. The title of a book is a partial key attribute because it can identify some books, but not all of them (since there can be multiple books with the same title).
- **Diamonds:**
    - **Single Diamond:** For regular relationships (e.g., Written_By, Classified_As, Manages).
    - **Double Diamond:** For identifying relationships with weak entities (e.g., Borrowed_By, Loaned_Book).
- **Lines and Connections:**
    - **Single Line:** Used for direct relationships and attribute connections.
    - **Dashed Line:** Used for derived attributes.
    - **Cardinality Indicators:**
        - **Crow's Feet Notation:** Used to represent (1:N) and (M:N) relationships.
        - **(Min, Max) Pairs:** Used to indicate participation constraints (e.g., (1,1), (0,N)).
- **Subclass and Superclass Notations:**
    - **Subclass and Superclass:** Implemented with "User" as superclass and "Administrator" and "Borrower" as subclasses.
    - **Disjoint ("d") Indicator:** Used to show that a "User" is either an "Administrator" or a "Borrower," but not both.
- **Specialization and Generalization Symbols:**
    - Used in subclassing to indicate inheritance relationships between "User" and its subclasses.

**Concepts Not Utilized:**

- **Aggregation:**
    - Not utilized because the current ER diagram does not have complex relationships requiring aggregation.
- **Optimization of 1:1 and 1:M Relationships (Part 27):**
    - Specific optimizations were considered but not applied, as the relationships are appropriately modeled.
- **Methods for Deriving Relational Schema from Specialization/Generalization (Part 28):**
    - Not detailed in the ER diagram, as they are applied during the conversion to a relational schema.
- **Unique Identifiers for Weak Entities (Part 26):**
    - Not additionally applied because the "Loan" entity already has a partial key attribute ("Loan Number") and identifying relationships.

---

### **5. Assemble the ER Diagram** - Final Outline Incorporating All Applicable Concepts

**Goal:** Create a comprehensive ER diagram utilizing all relevant concepts to accurately represent entities, attributes, relationships, and constraints.

#### **Step 1: Draw Entities and Attributes**

1. **Book Entity:**
    - **Shape:** **Single Rectangle** labeled "Book" (strong entity).
    - **Attributes:**
        - **ISBN:** **Underlined Oval** (primary key).
        - **Title:** Simple Oval.
        - **Publication Date:** Simple Oval.
        - **Pages:** Simple Oval.
        - **Copies Available:** Simple Oval.
        - **Publisher:** Simple Oval.
    - **Connections:** **Single Lines** connect attributes to the "Book" rectangle.
2. **Author Entity:**
    - **Shape:** **Single Rectangle** labeled "Author" (strong entity).
    - **Attributes:**
        - **Author ID:** **Underlined Oval** (primary key).
        - **Name:** **Composite Oval** with sub-ovals for:
            - **First Name**
            - **Middle Name**
            - **Last Name**
        - **Biography:** Simple Oval.
        - **Date of Birth:** Simple Oval.
        - **Date of Death:** **Optional Attribute** (indicated with a small circle or note).
        - **Nationality:** Simple Oval.
        - **Languages:** **Multivalued Oval** (double oval), as an author may speak multiple languages.
    - **Connections:** **Single Lines** connect attributes to the "Author" rectangle.
3. **Genre Entity:**
    - **Shape:** **Single Rectangle** labeled "Genre" (strong entity).
    - **Attributes:**
        - **Genre ID:** **Underlined Oval** (primary key).
        - **Title:** Simple Oval.
        - **Description:** Simple Oval.
    - **Connections:** **Single Lines** connect attributes to the "Genre" rectangle.
4. **Borrower Entity:**
    - **Shape:** **Single Rectangle** labeled "Borrower" (strong entity, subclass of "User").
    - **Attributes:**
        - **Borrower ID:** **Underlined Oval** (primary key).
        - **Membership ID:** Simple Oval.
        - **Borrowing Limit:** Simple Oval.
        - **Amount Payable:** Simple Oval.
    - **Inherited Attributes from "User":**
        - **Name**
        - **Contact Information**
        - **Address**
    - **Connections:** **Single Lines** connect attributes to the "Borrower" rectangle.
5. **Loan Entity:**
    - **Shape:** **Double Rectangle** labeled "Loan" (weak entity).
    - **Attributes:**
        - **Loan Number:** **Dashed Underlined Oval** (partial key).
        - **Loan Date:** Simple Oval.
        - **Due Date:** Simple Oval.
        - **Return Date:** Simple Oval.
        - **Fine Amount:** Simple Oval.
        - **Return Status:** Simple Oval.
    - **Connections:** **Single Lines** connect attributes to the "Loan" rectangle.
6. **Administrator Entity:**
    - **Shape:** **Single Rectangle** labeled "Administrator" (strong entity, subclass of "User").
    - **Attributes:**
        - **Admin ID:** **Underlined Oval** (primary key).
        - **Username:** Simple Oval.
        - **Password:** Simple Oval.
        - **Role:** Simple Oval.
        - **Permissions:** **Multivalued Oval** (double oval), as an administrator may have multiple permissions.
        - **Last Login:** Simple Oval.
    - **Inherited Attributes from "User":**
        - **Name**
        - **Contact Information**
    - **Connections:** **Single Lines** connect attributes to the "Administrator" rectangle.
7. **User Superclass:**
    - **Shape:** **Single Rectangle** labeled "User" (strong entity, superclass).
    - **Attributes:**
        - **User ID:** **Underlined Oval** (could be used if needed).
        - **Name:** **Composite Oval** with sub-ovals for "First Name," "Last Name."
        - **Contact Information:** **Composite Oval** with sub-ovals for "Phone Number," "Email."
        - **Address:** **Composite Oval** with sub-ovals for "Street," "City," "State," "ZIP Code."
    - **Connections:** **Single Lines** connect attributes to the "User" rectangle.

#### **Subclassing (Specialization):**

- **Configuration:**
    - **Connecting Line:** Draw lines from the "User" rectangle to both "Administrator" and "Borrower" rectangles.
    - **Small Circle:** Place a small circle at the point where the lines diverge from "User."
    - **Disjoint Indicator ("d"):** Place a "d" near the circle to indicate that the subclasses are disjoint.


#### **Step 2: Draw Relationships**

1. **Book ↔ Author (Written_By):**
    - **Relationship Name:** "Written_By"
    - **Shape:** **Single Diamond** labeled "Written_By."
    - **Connections:**
        - **Single Lines** from "Book" rectangle to "Written_By" diamond.
        - **Single Lines** from "Author" rectangle to "Written_By" diamond.
    - **Cardinality Indicators:**
        - **Book Side:** (1,N) — A book must have at least one author.
        - **Author Side:** (0,N) — An author may write zero or many books.
    - **Notation:** Use **crow's feet** at both ends or annotate with (min, max) pairs near the lines.
2. **Book ↔ Genre (Classified_As):**
    - **Relationship Name:** "Classified_As"
    - **Shape:** **Single Diamond** labeled "Classified_As."
    - **Connections:**
        - **Single Lines** from "Book" rectangle to "Classified_As" diamond.
        - **Single Lines** from "Genre" rectangle to "Classified_As" diamond.
    - **Cardinality Indicators:**
        - **Book Side:** (0,N)
        - **Genre Side:** (0,N)
    - **Notation:** Use **crow's feet** at both ends.
3. **Loan ↔ Borrower (Borrowed_By):**
    - **Relationship Name:** "Borrowed_By"
    - **Shape:** **Double Diamond** labeled "Borrowed_By" (identifying relationship).
    - **Connections:**
        - **Double Lines** from "Loan" rectangle to "Borrowed_By" diamond (total participation).
        - **Single Lines** from "Borrowed_By" diamond to "Borrower" rectangle.
    - **Cardinality Indicators:**
        - **Loan Side:** (1,1) — Each loan is associated with exactly one borrower.
        - **Borrower Side:** (0,N) — A borrower can have zero or many loans.
    - **Notation:** Use **(min, max)** pairs near the lines.
4. **Loan ↔ Book (Loaned_Book):**
    - **Relationship Name:** "Loaned_Book"
    - **Shape:** **Double Diamond** labeled "Loaned_Book" (identifying relationship).
    - **Connections:**
        - **Double Lines** from "Loan" rectangle to "Loaned_Book" diamond.
        - **Single Lines** from "Loaned_Book" diamond to "Book" rectangle.
    - **Cardinality Indicators:**
        - **Loan Side:** (1,1) — Each loan is for exactly one book.
        - **Book Side:** (0,N) — A book can be loaned zero or many times.
    - **Notation:** Use **(min, max)** pairs near the lines.
5. **Administrator ↔ Borrower (Manages):**
    - **Relationship Name:** "Manages"
    - **Shape:** **Single Diamond** labeled "Manages."
    - **Connections:**
        - **Single Lines** from "Administrator" rectangle to "Manages" diamond.
        - **Single Lines** from "Manages" diamond to "Borrower" rectangle.
    - **Cardinality Indicators:**
        - **Administrator Side:** (0,N) — An administrator can manage zero or many borrowers.
        - **Borrower Side:** (1,1) — Each borrower is managed by exactly one administrator.
    - **Notation:** Use **(min, max)** pairs near the lines.

#### **Step 3: Apply Additional Concepts**

- **Derived Attributes:**
    - **Age** in "Author":
        - **Shape:** **Dashed Oval** labeled "Age."
        - **Connections:** **Dashed Line** connecting "Age" oval to the "Author" rectangle.
        - **Purpose:** Indicates that "Age" is a derived attribute calculated from "Date of Birth."
- **Lines and Connections:**
    - Ensure all entities, attributes, and relationships are connected using appropriate lines.
    - **Cardinality Indicators:** Consistently use symbols (1, N) and/or (min, max) pairs to indicate participation constraints.

