/// <reference types="cypress" />

describe('Computer form', () => {
    beforeEach(() => {
        cy.visit('https://computer-database.gatling.io/computers')
    })

    it('can create a new computer entry', () => {
        cy.get('#add').click()
        cy.contains('Add a computer')
        cy.url().should('include', '/new')
        cy.get('#name').type('abc')
        cy.get('.btn.primary').click()
        cy.get('.alert-message.warning').should('be.visible')
            .contains('has been created')
        cy.url().should('not.include', '/new')
        //should also check that it is listed
        //this test did not test all specific fields which is out of scope
    })

    it('cannot have empty fields', () => {
        cy.get('#add').click()
        cy.get('.btn.primary').click()
        cy.get('.help-inline').should('contain', 'Failed to refine type : Predicate isEmpty() did not fail.')
    })

    it('can cancel the computer entry form', () => {
        cy.get('#add').click()
        cy.get('#name').type('abc')
        cy.get('a.btn').click()
        cy.url().should('not.include', '/new')
    })

    it('can edit the computer form', () => {
        cy.get('tbody > :nth-child(1) > :nth-child(1) > a').click()
        cy.url().should('include', '/381')
        cy.get('.btn.danger').should('be.visible')
        cy.get('select').select('IBM').should('have.value', '13')
        cy.get('.btn.primary').click()
        cy.get('.alert-message.warning').should('be.visible')
            .contains('has been updated')
        cy.url().should('not.include', '/381')
       
    })

    it('can delete a computer entry', () => {
        cy.get('tbody > :nth-child(1) > :nth-child(1) > a').click()
        cy.get('.btn.danger').click({force: true})
        cy.get('.alert-message.warning').should('be.visible')
            .contains('has been deleted')
    })
})

describe('Filter by name', () => {
    beforeEach(() => {
        cy.visit('https://computer-database.gatling.io/computers')
    })

    const valueInput = [{
        type: 'characters', 
        value: 'ibm'
    },
    {
        type: 'numbers',
        value: '12'
    }]

    valueInput.forEach((type) => {
        it(`validates ${type.type} value`, () => {
            cy.get('#searchbox').type(`${type.value}`)
            cy.get('#searchsubmit').click()
                cy.get('.computers').should('be.visible')
        })
    })

    it(`validates special character value`, () => {
        cy.get('#searchbox').type('!&#)%)#_=')
        cy.get('#searchsubmit').click()
        cy.get('.well').should('be.visible')   

    })

    it('validates empty field value', () => {
        cy.get('#searchsubmit').click()
        cy.get('#searchbox').should('have.attr', 'required')
    })

    it('has a clear field option', () => {
        cy.get('#searchbox').type('typetext')
        cy.get('#searchsubmit').click()
        cy.get('#searchbox').clear()
            .should('have.value', '')
            //should display entire list of computers
    })
})

describe('Page navigations', () => {
    const sortOrder = [{
        header: 'name',
        link: 'asc'
    },
    {
        header: 'name',
        link: 'desc'
    },
    {
        header: 'introduced',
        link: 'desc'
    },
    {
        header: 'introduced',
        link: 'asc'
    },
    {
        header: 'discontinued',
        link: 'asc'
    },
    {
        header: 'discontinued',
        link: 'desc'
    },
    {
        header: 'company',
        header2: 'companyName',
        link: 'desc'
    },
    {
        header: 'company',
        header2: 'companyName',
        link: 'asc'
    }]
        
    before(() => {
        cy.visit('https://computer-database.gatling.io/computers')
    })

    it('can navigate to the next page', () => {
        cy.get('.next > a').click()
        cy.get('.current > a').should('have.text', 'Displaying 11 to 20 of 574')
        cy.get('.prev > a').should('have.attr', 'href')
    })

    it('can navigate to the first page', () => {
        cy.get('.prev > a').click()
        cy.get('.prev').should('have.class', 'disabled')
    })
    
    sortOrder.forEach((order) => {
        it(`can sort columns ${order.header} in ${order.link}`, () => {
            cy.get(`.col-${order.header}.header > a`).click()
                if((order.header) == 'company') {
                cy.get(`.col-${order.header}.header > a`).should('have.attr', 'href', `/computers?p=0&n=10&s=${order.header2}&d=${order.link}`)
                }
                else
                {
                cy.get(`.col-${order.header}.header > a`).should('have.attr', 'href', `/computers?p=0&n=10&s=${order.header}&d=${order.link}`)
                }
        })
    })

})