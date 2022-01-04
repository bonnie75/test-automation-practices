/// <reference types="cypress" />

Cypress.Commands.add('fillRequiredFields', (user) => {
    cy.get('#firstName').type(user.first)
    cy.get('#lastName').type(user.last)
    cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check(user.gender, {force:true})
    cy.get('#userNumber').type(user.phone)
  })

describe('Submitting a Student form', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/automation-practice-form')
    })

    it('can enter valid values in text fields', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#userEmail').type("allie.fake@fake.ca")
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('2', {force:true})
        cy.get('#currentAddress').type('2 berkeley street, Toronto, ON M5A 1B2')

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
    })

    it('can select multiple hobbies checkboxes', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('1', {force:true})
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('2', {force:true})
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('3', {force:true})
    
        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('Sports, Reading, Music')
    })

    it('can select one hobbies checkbox', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('3', {force:true})

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('Music')
    })

    it('can upload a file with image extension', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#uploadPicture').attachFile('cypresslogosm.jpg')

        cy.get('#submit').click()
        cy.get('.modal-content').should('have.length', 1)
            .contains('cypresslogosm.jpg')
    })
    
    it('does not upload a file that is not an image', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#uploadPicture').attachFile('example.json')

        cy.get('#submit').click()
        cy.get('.modal-content').should('not.exist')
        cy.get('#errorMessage').should('be.visible')
    })

    it('can select and display the date of birth', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#dateOfBirth').click()
        cy.get('.react-datepicker__month-select').select('May')
        cy.get('.react-datepicker__year-select').select('1957')
        cy.get('.react-datepicker__day.react-datepicker__day--004.react-datepicker__day--weekend').click()

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('04 May,1957')
    })

    it('can type in a date of birth', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#dateOfBirthInput').dblclick()
            .type('January 1, 1988')

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('01 January,1988')
    })

    it('should not be able to enter non-date values', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#dateOfBirthInput').click()
            .type('test field {enter}')

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('02 January,2022')
    })

    it('should select State before City', () => {
        cy.fillRequiredFields({ first: 'Allie', last: 'Kat', gender: 'Female', phone: '4441231234' })
        cy.get('#react-select-4-input').should('be.disabled')
        cy.get('#react-select-3-input').type('NCR {enter}', {force:true}).tab()
        cy.get('#react-select-4-input').type('Delhi {enter}', {force:true}).should('be.enabled')
        
        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
            .contains('NCR Delhi')
    })
})

describe('Submitting a bad form', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/automation-practice-form')
    })

    it('does not accept empty values in text fields', () => {
        // an empty form is submitted and uses afterEach()
    })

    it('must select gender radio button', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('#userNumber').type('3331231234')
    })

    it.skip('must have 10 digits for mobile field', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('1234').click()
    })

    it('does not accept negative values in Mobile field', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('-4441231234').click()
    })

    afterEach(() => {
        cy.get("#submit").click()
        cy.get('.modal-content').should('not.exist')
    })
}) 
