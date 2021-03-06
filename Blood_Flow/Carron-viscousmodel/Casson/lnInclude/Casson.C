/*---------------------------------------------------------------------------*\
  =========                 |
  \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
   \\    /   O peration     |
    \\  /    A nd           | Copyright (C) 2011-2015 OpenFOAM Foundation
     \\/     M anipulation  |
-------------------------------------------------------------------------------
License
    This file is part of OpenFOAM.

    OpenFOAM is free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    OpenFOAM is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
    FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
    for more details.

    You should have received a copy of the GNU General Public License
    along with OpenFOAM.  If not, see <http://www.gnu.org/licenses/>.

\*---------------------------------------------------------------------------*/

#include "Casson.H"
#include "addToRunTimeSelectionTable.H"
#include "surfaceFields.H"

// * * * * * * * * * * * * * * Static Data Members * * * * * * * * * * * * * //

namespace Foam
{
namespace viscosityModels
{
    defineTypeNameAndDebug(Casson, 0);
    addToRunTimeSelectionTable
    (
        viscosityModel,
        Casson,
        dictionary
    );
}
}


// * * * * * * * * * * * * Private Member Functions  * * * * * * * * * * * * //

Foam::tmp<Foam::volScalarField>
Foam::viscosityModels::Casson::calcNu() const
{
  //  return
  //      nuInf_
  //    + (nu0_ - nuInf_)
  //     *pow(scalar(1) + pow(k_*strainRate(), a_), (n_ - 1.0)/a_);
  //     return max
return max
(
nuMin_,
min
(
nuMax_,
pow
(
pow(
tau0_/max
(
strainRate(),
dimensionedScalar("VSMALL", dimless/dimTime,VSMALL)
),0.5
)
+pow(m_,0.5)
,
scalar(2.0)
)
)
);
}


// * * * * * * * * * * * * * * * * Constructors  * * * * * * * * * * * * * * //

Foam::viscosityModels::Casson::Casson
(
    const word& name,
    const dictionary& viscosityProperties,
    const volVectorField& U,
    const surfaceScalarField& phi
)
:
    viscosityModel(name, viscosityProperties, U, phi),
    CassonCoeffs_(viscosityProperties.subDict(typeName + "Coeffs")),
//    nu0_("nu0", dimViscosity, CassonCoeffs_),
//    nuInf_("nuInf", dimViscosity, CassonCoeffs_),
//    k_("k", dimTime, CassonCoeffs_),
//    n_("n", dimless, CassonCoeffs_),
//    a_
//    (
//        CassonCoeffs_.lookupOrDefault
//        (
//            "a",
//            dimensionedScalar("a", dimless, 2)
//        )
//    ),
m_(CassonCoeffs_.lookup("m")),
tau0_(CassonCoeffs_.lookup("tau0")),
nuMin_(CassonCoeffs_.lookup("nuMin")),
nuMax_(CassonCoeffs_.lookup("nuMax")),
    nu_
    (
        IOobject
        (
            "nu",
            U_.time().timeName(),
            U_.db(),
            IOobject::NO_READ,
            IOobject::AUTO_WRITE
        ),
        calcNu()
    )
{}


// * * * * * * * * * * * * * * Member Functions  * * * * * * * * * * * * * * //

bool Foam::viscosityModels::Casson::read
(
    const dictionary& viscosityProperties
)
{
    viscosityModel::read(viscosityProperties);

    CassonCoeffs_ = viscosityProperties.subDict(typeName + "Coeffs");

//    CassonCoeffs_.lookup("nu0") >> nu0_;
//    CassonCoeffs_.lookup("nuInf") >> nuInf_;
//    CassonCoeffs_.lookup("k") >> k_;
//    CassonCoeffs_.lookup("n") >> n_;
//    a_ = CassonCoeffs_.lookupOrDefault
//    (
//        "a",
//        dimensionedScalar("a", dimless, 2)
//    );
CassonCoeffs_.lookup("m") >> m_;
CassonCoeffs_.lookup("tau0") >> tau0_;
CassonCoeffs_.lookup("nuMin") >> nuMin_;
CassonCoeffs_.lookup("nuMax") >> nuMax_;
    return true;
}


// ************************************************************************* //
