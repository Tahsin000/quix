<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assignment Question Calculator</title>
    <!-- CSRF Token for file logging -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Load Tailwind CSS to replicate shadcn design system -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Load jsPDF and JSZip for PDF generation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        royal: '#4169e1', // Royal Blue theme
                        background: '#ffffff',
                        foreground: '#09090b', // Shadcn black
                        muted: '#f4f4f5',
                        'muted-foreground': '#71717a',
                        border: '#e4e4e7',
                        input: '#e4e4e7',
                        ring: '#09090b',
                    },
                    fontFamily: {
                        sans: ['Inter', 'ui-sans-serif', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'Helvetica Neue', 'Arial', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <style>
        /* Shadcn UI Component Replications in CSS */
        body {
            background-color: #f8fafc;
        }
        .card {
            background-color: #ffffff;
            color: #09090b;
            border: 1px solid #e4e4e7;
            border-radius: 0.75rem;
            box-shadow: 0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1);
        }
        .input-shadcn {
            display: flex;
            height: 2.5rem;
            width: 100%;
            border-radius: 0.375rem;
            border: 1px solid #e4e4e7;
            background-color: transparent;
            padding: 0.5rem 0.75rem;
            font-size: 0.875rem;
            line-height: 1.25rem;
            transition-property: color, background-color, border-color, text-decoration-color, fill, stroke;
            transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
            transition-duration: 150ms;
        }
        .input-shadcn:focus-visible {
            outline: 2px solid transparent;
            outline-offset: 2px;
            box-shadow: 0 0 0 2px #ffffff, 0 0 0 4px #09090b;
        }
        .label-shadcn {
            font-size: 0.875rem;
            font-weight: 500;
            line-height: 1;
            margin-bottom: 0.5rem;
            display: block;
        }
        .helper-text {
            font-size: 0.8rem;
            color: #71717a;
            margin-top: 0.25rem;
        }
        .btn-royal {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 0.375rem;
            font-size: 0.875rem;
            font-weight: 500;
            height: 2.5rem;
            padding-left: 1rem;
            padding-right: 1rem;
            background-color: #4169e1;
            color: white;
            transition: all 150ms ease-in-out;
            width: 100%;
            cursor: pointer;
        }
        .btn-royal:hover {
            background-color: #3154b3;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }
        .btn-royal:active {
            transform: translateY(0);
            box-shadow: none;
        }
        .btn-royal:disabled {
            opacity: 0.7;
            cursor: not-allowed;
        }
        .tooltip-icon {
            display: inline-block;
            margin-left: 4px;
            color: #71717a;
            cursor: help;
        }
        
        /* Ensure long math wraps nicely on mobile instead of forcing scroll */
        .math-wrap {
            word-break: break-all;
            white-space: normal;
        }
    </style>
</head>
<body class="min-h-screen p-4 md:p-8 flex flex-col items-center font-sans">

    <div class="card w-full max-w-3xl p-5 md:p-8 mt-4 md:mt-0">
        <div class="mb-6 border-b pb-4">
            <h1 class="text-2xl font-bold tracking-tight text-royal leading-tight">Network Security Assignment Calculator</h1>
            <p class="text-muted-foreground mt-2 text-sm md:text-base">Course Code: MCSE 632. Enter your details below to calculate your 5 unique question numbers.</p>
        </div>

        <!-- Inputs Summary Container (Hidden initially) -->
        <div id="inputsSummary" class="hidden mb-6 p-4 bg-slate-50 rounded-lg border border-slate-200 flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4 shadow-sm transition-all">
            <div>
                <h3 class="text-sm font-semibold text-slate-800 mb-1 flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-green-600"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>
                    Calculation Successful
                </h3>
                <p id="summaryText" class="text-xs md:text-sm text-slate-600 leading-relaxed"></p>
            </div>
            <button type="button" id="editInputsBtn" class="flex-shrink-0 px-4 py-2 bg-white border border-border rounded-md text-slate-700 text-sm font-medium hover:bg-slate-50 transition-colors flex items-center gap-2 shadow-sm w-full sm:w-auto justify-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg>
                Edit Inputs
            </button>
        </div>

        <!-- Form Container -->
        <div id="formContainer" class="transition-all duration-300">
            <form id="calculatorForm" class="grid grid-cols-1 md:grid-cols-2 gap-5 md:gap-6">
                
                <!-- Google Form Date -->
                <div>
                    <label class="label-shadcn" for="inputD">Submission Day (D) <span class="tooltip-icon" title="The day value (1-31) of your Google Form Submission Date">&#9432;</span></label>
                    <input type="number" id="inputD" class="input-shadcn" required min="1" max="31" placeholder="e.g., 15">
                    <p class="helper-text">Day value only.</p>
                </div>

                <!-- Student ID -->
                <div>
                    <label class="label-shadcn" for="inputL">Student ID Last 2 Digits (L) <span class="tooltip-icon" title="Only digits allowed. If ID is 1234567890, enter 90">&#9432;</span></label>
                    <input type="number" id="inputL" class="input-shadcn" required min="0" max="99" placeholder="e.g., 89">
                </div>

                <!-- Mobile Number -->
                <div>
                    <label class="label-shadcn" for="inputM">Mobile Last 3 Digits (M) <span class="tooltip-icon" title="Last 3 digits of your active contact number">&#9432;</span></label>
                    <input type="number" id="inputM" class="input-shadcn" required min="0" max="999" placeholder="e.g., 567">
                </div>

                <!-- DOB Month -->
                <div>
                    <label class="label-shadcn" for="inputB">Birth Month Value (B) <span class="tooltip-icon" title="Numeric value of your birth month (1-12)">&#9432;</span></label>
                    <input type="number" id="inputB" class="input-shadcn" required min="1" max="12" placeholder="e.g., 8">
                    <p class="helper-text">Jan = 1, Dec = 12.</p>
                </div>

                <!-- District Serial -->
                <div>
                    <label class="label-shadcn" for="inputH">District Serial (H) <span class="tooltip-icon" title="Check the Assignment Submission Guidelines for your District number (1-64)">&#9432;</span></label>
                    <input type="number" id="inputH" class="input-shadcn" required min="1" max="64" placeholder="e.g., 9">
                </div>

                <!-- Thana/Upazila Serial -->
                <div>
                    <label class="label-shadcn" for="inputU">Thana Serial (U) <span class="tooltip-icon" title="Check the Assignment Submission Guidelines for your Thana number (1-514)">&#9432;</span></label>
                    <input type="number" id="inputU" class="input-shadcn" required min="1" max="514" placeholder="e.g., 67">
                </div>

                <!-- EMTS Code -->
                <div>
                    <label class="label-shadcn" for="inputE">EMTS Code (E) <span class="tooltip-icon" title="BD Extended Post Code from the provided list">&#9432;</span></label>
                    <input type="number" id="inputE" class="input-shadcn" required placeholder="e.g., 400000">
                    <p class="helper-text">Your 6-digit Extended Post Code.</p>
                </div>
                
                <!-- Total Students (C) -->
                <div>
                    <label class="label-shadcn" for="inputC">Total Students (C) <span class="tooltip-icon" title="Total count of students in the class">&#9432;</span></label>
                    <input type="number" id="inputC" class="input-shadcn" required min="1" value="29">
                </div>
                
                <!-- Total Questions (T) -->
                <div>
                    <label class="label-shadcn" for="inputT">Total Questions (T) <span class="tooltip-icon" title="Total number of assignment questions available">&#9432;</span></label>
                    <input type="number" id="inputT" class="input-shadcn" required min="1" value="105">
                </div>

                <div class="md:col-span-2 mt-2">
                    <button type="submit" class="btn-royal py-3 h-auto text-base">Calculate My Questions</button>
                </div>
            </form>
        </div>

        <!-- Results Section -->
        <div id="resultSection" class="mt-2 hidden transition-all duration-500 ease-in-out">
            
            <h2 class="text-lg md:text-xl font-semibold mb-4 flex items-center text-slate-800">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-royal mr-2"><polyline points="20 6 9 17 4 12"></polyline></svg>
                Your Assigned Questions
            </h2>
            
            <!-- Badges -->
            <div class="flex flex-wrap gap-2 md:gap-3 mb-8" id="badgesContainer">
                <!-- Question badges injected via JS -->
            </div>

            <!-- Detailed Questions and Answers Section -->
            <div id="detailedQuestionsContainer" class="space-y-4 mb-6">
                <!-- Detailed questions injected via JS -->
            </div>

            <!-- Action Buttons for PDF -->
            <div class="mt-8 flex justify-center border-t border-border pt-6">
                <button type="button" id="openPdfModalBtn" class="btn-royal py-3 px-6 h-auto text-base shadow-lg hover:shadow-xl flex items-center justify-center gap-2 w-full md:w-auto">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                    Prepare Assignment PDFs
                </button>
            </div>

            <!-- Math Accordion -->
            <div class="mt-6 border border-border rounded-lg bg-white overflow-hidden shadow-sm">
                <button type="button" id="toggleMathBtn" class="w-full px-4 py-3 flex justify-between items-center bg-slate-50 hover:bg-slate-100 transition-colors focus:outline-none focus:ring-2 focus:ring-royal focus:ring-inset">
                    <span class="font-medium text-slate-800 text-sm flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-slate-500"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="16" x2="12" y2="12"></line><line x1="12" y1="8" x2="12.01" y2="8"></line></svg>
                        View Step-by-Step Mathematical Breakdown
                    </span>
                    <svg id="mathChevron" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="text-slate-500 transition-transform duration-200"><polyline points="6 9 12 15 18 9"></polyline></svg>
                </button>
                <div id="mathContent" class="hidden p-4 border-t border-border bg-white">
                    <p class="mb-3 text-sm text-slate-600">Constants used: C = 29 (Students), T = 105 (Total Questions).</p>
                    <div class="mb-4 bg-slate-50 p-3 rounded-md border border-slate-200">
                        <p class="font-mono text-xs text-royal break-all">Formula:<br>Qi = [ { (D*U + L + M) * H * E + i*C*B } mod T ] + 1</p>
                    </div>
                    
                    <ul id="stepsList" class="space-y-3 font-mono text-xs md:text-sm text-slate-700">
                        <!-- Steps injected via JS -->
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-8 mb-4 text-center text-sm text-slate-500 w-full max-w-3xl">
        Crafted by 
        <a href="https://www.linkedin.com/in/mohammad-tahsin-afrar/" target="_blank" rel="noopener noreferrer" class="font-medium text-slate-700 hover:text-royal hover:underline transition-colors">
            Mohammad Tahsin Afrar
        </a>
    </footer>

    <!-- PDF Guidelines Modal -->
    <div id="pdfModal" class="fixed inset-0 z-50 hidden bg-black/50 flex items-center justify-center p-4 overflow-y-auto">
        <div class="bg-white rounded-xl shadow-2xl w-full max-w-2xl max-h-[90vh] flex flex-col overflow-hidden transform transition-all">
            <div class="px-6 py-4 border-b border-border flex justify-between items-center bg-slate-50">
                <h2 class="text-lg font-bold text-slate-800">Assignment Cover Page Details</h2>
                <button type="button" id="closeModalBtn" class="text-slate-400 hover:text-slate-600 transition-colors">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            
            <div class="p-6 overflow-y-auto flex-1">
                <p class="text-sm text-slate-600 mb-6">Please fill out the information below to generate your 5 formatted assignment PDFs. Known information has been pre-filled.</p>
                
                <form id="pdfGenerationForm" class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <!-- Student Info -->
                    <div>
                        <label class="label-shadcn" for="pdfStudentId">Student ID (Full)</label>
                        <input type="text" id="pdfStudentId" class="input-shadcn border-royal ring-1 ring-royal/30" required placeholder="e.g., 25106789">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfStudentName">Student Full Name</label>
                        <input type="text" id="pdfStudentName" class="input-shadcn" required placeholder="John Doe">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfSemester">Academic Semester</label>
                        <input type="text" id="pdfSemester" class="input-shadcn" required placeholder="e.g., Fall 2026">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfSession">Session</label>
                        <input type="text" id="pdfSession" class="input-shadcn" required placeholder="e.g., 2025-2026">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfBatch">Batch/Section</label>
                        <input type="text" id="pdfBatch" class="input-shadcn" required placeholder="e.g., 6th Batch / Section A">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfEmail">Email (Google Form Email)</label>
                        <input type="email" id="pdfEmail" class="input-shadcn" required placeholder="student@example.com">
                    </div>
                    
                    <div class="md:col-span-2 border-t border-border my-2"></div>
                    
                    <!-- Course Info -->
                    <div>
                        <label class="label-shadcn" for="pdfDept">Department name</label>
                        <input type="text" id="pdfDept" class="input-shadcn" required value="Computer Science and Engineering">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfFaculty">Faculty Name</label>
                        <input type="text" id="pdfFaculty" class="input-shadcn" required placeholder="Enter Faculty Name">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfUniversity">University name</label>
                        <input type="text" id="pdfUniversity" class="input-shadcn" required placeholder="Enter University Name">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfCourseNo">Course No.</label>
                        <input type="text" id="pdfCourseNo" class="input-shadcn" required value="MCSE 632">
                    </div>
                    <div class="md:col-span-2">
                        <label class="label-shadcn" for="pdfCourseTitle">Course Title</label>
                        <input type="text" id="pdfCourseTitle" class="input-shadcn" required value="Computer Networks Security">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfCourseCredits">Course Credits</label>
                        <input type="text" id="pdfCourseCredits" class="input-shadcn" required value="3">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfAssignmentNo">Assignment No.</label>
                        <input type="text" id="pdfAssignmentNo" class="input-shadcn" required value="1">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfSubmissionDate">Google Form Sub. Date</label>
                        <input type="text" id="pdfSubmissionDate" class="input-shadcn" required placeholder="e.g., 15 May 2026">
                    </div>
                    <div>
                        <label class="label-shadcn" for="pdfTotalStudents">Total Count of Students</label>
                        <input type="number" id="pdfTotalStudents" class="input-shadcn" required value="29">
                    </div>
                    <div class="md:col-span-2">
                        <label class="label-shadcn" for="pdfTotalExercises">Total Count of Exercises/Questions</label>
                        <input type="number" id="pdfTotalExercises" class="input-shadcn" required value="105">
                    </div>
                </form>
            </div>
            
            <div class="px-6 py-4 border-t border-border bg-slate-50 flex flex-col sm:flex-row justify-end gap-3">
                <button type="button" id="cancelModalBtn" class="px-4 py-2 border border-border rounded-md text-sm font-medium text-slate-700 bg-white hover:bg-slate-50 transition-colors w-full sm:w-auto">Cancel</button>
                <button type="button" id="generatePdfsBtn" class="px-6 py-2 bg-royal text-white rounded-md text-sm font-medium hover:bg-blue-700 transition-colors flex justify-center items-center gap-2 w-full sm:w-auto shadow-sm">
                    <svg id="loadingSpinner" class="animate-spin hidden h-4 w-4 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
                    <span id="generateBtnText">Download PDF</span>
                </button>
            </div>
        </div>
    </div>

    <script>
        let questionDataset = {};
        let globalAssignedQuestions = [];
        
        // Fetch the dataset on load
        fetch('/data/questions.json')
            .then(res => res.json())
            .then(data => {
                questionDataset = data;
            })
            .catch(err => console.error("Could not load question dataset:", err));

        // Math Accordion Toggle
        document.getElementById('toggleMathBtn').addEventListener('click', function() {
            const content = document.getElementById('mathContent');
            const chevron = document.getElementById('mathChevron');
            content.classList.toggle('hidden');
            chevron.classList.toggle('rotate-180');
        });

        // Edit Inputs Toggle
        document.getElementById('editInputsBtn').addEventListener('click', function() {
            document.getElementById('formContainer').classList.remove('hidden');
            document.getElementById('inputsSummary').classList.add('hidden');
            document.getElementById('resultSection').classList.add('hidden');
            // Reset math accordion state
            document.getElementById('mathContent').classList.add('hidden');
            document.getElementById('mathChevron').classList.remove('rotate-180');
        });

        document.getElementById('calculatorForm').addEventListener('submit', function(e) {
            e.preventDefault();

            // 1. Fetch Inputs
            const dVal = document.getElementById('inputD').value;
            const lVal = document.getElementById('inputL').value;
            const mVal = document.getElementById('inputM').value;
            const bVal = document.getElementById('inputB').value;
            const hVal = document.getElementById('inputH').value;
            const uVal = document.getElementById('inputU').value;
            const eVal = document.getElementById('inputE').value;
            const cVal = document.getElementById('inputC').value;
            const tVal = document.getElementById('inputT').value;

            const D = BigInt(dVal);
            const L = BigInt(lVal);
            const M = BigInt(mVal);
            const B = BigInt(bVal);
            const H = BigInt(hVal);
            const U = BigInt(uVal);
            const E = BigInt(eVal);
            const C = BigInt(cVal);
            const T = BigInt(tVal);

            // 3. Update UI State (Hide form, show summary & results)
            document.getElementById('formContainer').classList.add('hidden');
            const summary = document.getElementById('inputsSummary');
            summary.classList.remove('hidden');
            
            // Format summary string nicely
            document.getElementById('summaryText').innerHTML = 
                `<strong>D:</strong> ${dVal} &nbsp;&bull;&nbsp; <strong>L:</strong> ${lVal} &nbsp;&bull;&nbsp; <strong>M:</strong> ${mVal} &nbsp;&bull;&nbsp; <strong>B:</strong> ${bVal} &nbsp;&bull;&nbsp; <strong>H:</strong> ${hVal} &nbsp;&bull;&nbsp; <strong>U:</strong> ${uVal} &nbsp;&bull;&nbsp; <strong>E:</strong> ${eVal} &nbsp;&bull;&nbsp; <strong>C:</strong> ${cVal} &nbsp;&bull;&nbsp; <strong>T:</strong> ${tVal}`;
            
            // Sync with PDF modal inputs
            document.getElementById('pdfTotalStudents').value = cVal;
            document.getElementById('pdfTotalExercises').value = tVal;
            document.getElementById('mathContent').querySelector('p').innerText = `Constants used: C = ${cVal} (Students), T = ${tVal} (Total Questions).`;

            const resultSection = document.getElementById('resultSection');
            const badgesContainer = document.getElementById('badgesContainer');
            const detailedContainer = document.getElementById('detailedQuestionsContainer');
            const stepsList = document.getElementById('stepsList');
            
            // Show with opacity transition
            resultSection.classList.remove('hidden');
            resultSection.style.opacity = 0;
            setTimeout(() => {
                resultSection.style.opacity = 1;
            }, 50);
            
            badgesContainer.innerHTML = '';
            stepsList.innerHTML = '';
            
            if (detailedContainer) {
                detailedContainer.innerHTML = '';
            }

            // Base math that remains the same for all i
            const baseCalculation = (D * U + L + M) * H * E;
            
            // Generate breakdown for step 1 just to show the user how the first part works
            const commonMathLi = document.createElement('li');
            commonMathLi.className = "p-3 bg-slate-50 rounded border border-slate-200 overflow-hidden";
            commonMathLi.innerHTML = `<div class="font-semibold text-slate-800 mb-1">Base Calculation:</div>
                                      <div class="math-wrap">(${D}*${U} + ${L} + ${M}) * ${H} * ${E} = <span class="text-royal font-bold break-all">${baseCalculation}</span></div>`;
            stepsList.appendChild(commonMathLi);

            // 4. Calculate for i = 1 to 5
            globalAssignedQuestions = []; // Reset global questions array
            
            for(let i = 1n; i <= 5n; i++) {
                const iPart = i * C * B;
                const totalSum = baseCalculation + iPart;
                const modResult = totalSum % T;
                const Qi = modResult + 1n;
                
                globalAssignedQuestions.push(Number(Qi));

                // Add to step-by-step breakdown (visualized as neat cards to prevent unreadable line breaks)
                const stepLi = document.createElement('li');
                stepLi.className = "p-3 bg-white rounded border border-slate-200 shadow-sm overflow-hidden";
                stepLi.innerHTML = `
                    <div class="font-semibold text-slate-800 mb-1">Step i=${i}:</div>
                    <div class="math-wrap text-slate-600">[ { <span class="text-royal font-medium break-all">${baseCalculation}</span> + (${i}*${C}*${B}) } mod ${T} ] + 1</div>
                    <div class="math-wrap text-slate-600 mt-1">&rarr; [ <span class="break-all">${totalSum}</span> mod ${T} ] + 1</div>
                    <div class="mt-2 pt-2 border-t border-slate-100">
                        <strong>Result: ${modResult} + 1 = <span class="text-royal text-base">${Qi}</span></strong>
                    </div>`;
                stepsList.appendChild(stepLi);

                // Create nice visual badge (responsive size)
                const badge = document.createElement('div');
                badge.className = "bg-foreground text-white px-4 py-2 md:px-5 md:py-3 rounded-lg font-bold text-lg md:text-xl shadow-md flex items-center justify-center min-w-[3.5rem] md:min-w-[4rem] transition-transform duration-200 hover:scale-105 border-2 border-transparent hover:border-royal";
                badge.innerText = `Q${Qi}`;
                badgesContainer.appendChild(badge);

                // Add to Detailed Questions Section
                if (detailedContainer) {
                    const qData = questionDataset[Qi.toString()];
                    const qTitle = qData ? qData.title : "Title not found in dataset.";
                    const qAnswer = qData ? qData.answer : "Solution not found in dataset.";
                    
                    const qCard = document.createElement('div');
                    qCard.className = "bg-white p-4 md:p-5 rounded-lg border border-border shadow-sm transition-all hover:shadow-md";
                    qCard.innerHTML = `
                        <div class="flex items-start gap-3 mb-3">
                            <span class="flex-shrink-0 bg-royal text-white text-xs md:text-sm font-bold px-2.5 py-1 rounded-full mt-0.5">Q${Qi}</span>
                            <h4 class="font-medium text-slate-900 leading-snug text-sm md:text-base">${qTitle}</h4>
                        </div>
                        <div class="pl-0 md:pl-11 mt-3 md:mt-0">
                            <div class="p-3 md:p-4 bg-slate-50 border-l-4 border-royal rounded-r-md text-sm text-slate-700 leading-relaxed relative">
                                <strong class="block mb-2 text-slate-900 flex items-center gap-1.5 text-xs md:text-sm uppercase tracking-wide">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" class="text-royal"><path d="m9 18 6-6-6-6"/></svg>
                                    Solution
                                </strong>
                                <span class="opacity-90 block mt-1">${qAnswer}</span>
                            </div>
                        </div>
                    `;
                    detailedContainer.appendChild(qCard);
                }
            }
            
            // Scroll to view result smoothly (scroll to top of summary)
            setTimeout(() => {
                summary.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }, 100);

            // Send local logging request
            const csrfTokenElement = document.querySelector('meta[name="csrf-token"]');
            if(csrfTokenElement) {
                fetch('/calculator/save', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfTokenElement.getAttribute('content'),
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({
                        D: dVal, L: lVal, M: mVal, B: bVal, H: hVal, U: uVal, E: eVal, C: cVal, T: tVal,
                        questions: globalAssignedQuestions
                    })
                }).catch(err => console.error("Error saving local log:", err));
            }
        });

        // --- PDF Generation Logic ---
        const { jsPDF } = window.jspdf;
        
        const pdfModal = document.getElementById('pdfModal');
        const openPdfModalBtn = document.getElementById('openPdfModalBtn');
        const closeModalBtn = document.getElementById('closeModalBtn');
        const cancelModalBtn = document.getElementById('cancelModalBtn');
        
        openPdfModalBtn.addEventListener('click', () => {
            pdfModal.classList.remove('hidden');
            // Try to pre-fill Student ID if L is provided
            const lVal = document.getElementById('inputL').value;
            const pdfIdInput = document.getElementById('pdfStudentId');
            if (lVal && !pdfIdInput.value) {
                // We just set a placeholder hint or suffix
            }
        });
        
        const closeModal = () => pdfModal.classList.add('hidden');
        closeModalBtn.addEventListener('click', closeModal);
        cancelModalBtn.addEventListener('click', closeModal);

        document.getElementById('generatePdfsBtn').addEventListener('click', async function() {
            // Validate form
            const form = document.getElementById('pdfGenerationForm');
            if(!form.checkValidity()) {
                form.reportValidity();
                return;
            }
            
            // UI Loading state
            const btn = this;
            const spinner = document.getElementById('loadingSpinner');
            const btnText = document.getElementById('generateBtnText');
            btn.disabled = true;
            spinner.classList.remove('hidden');
            btnText.innerText = 'Generating...';
            
            try {
                // Collect Form Data
                const data = {
                    studentId: document.getElementById('pdfStudentId').value,
                    studentName: document.getElementById('pdfStudentName').value,
                    semester: document.getElementById('pdfSemester').value,
                    session: document.getElementById('pdfSession').value,
                    batch: document.getElementById('pdfBatch').value,
                    email: document.getElementById('pdfEmail').value,
                    dept: document.getElementById('pdfDept').value,
                    faculty: document.getElementById('pdfFaculty').value,
                    university: document.getElementById('pdfUniversity').value,
                    courseNo: document.getElementById('pdfCourseNo').value,
                    courseTitle: document.getElementById('pdfCourseTitle').value,
                    courseCredits: document.getElementById('pdfCourseCredits').value,
                    assignmentNo: document.getElementById('pdfAssignmentNo').value,
                    subDate: document.getElementById('pdfSubmissionDate').value,
                    totalStudents: document.getElementById('pdfTotalStudents').value,
                    totalExercises: document.getElementById('pdfTotalExercises').value,
                };

                // Send local logging request for detailed student information
                const csrfTokenElement = document.querySelector('meta[name="csrf-token"]');
                if(csrfTokenElement) {
                    fetch('/calculator/save-student', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfTokenElement.getAttribute('content'),
                            'Accept': 'application/json'
                        },
                        body: JSON.stringify({
                            ...data,
                            assigned_questions: globalAssignedQuestions
                        })
                    }).catch(err => console.error("Error saving student info log:", err));
                }

                const doc = new jsPDF('p', 'mm', 'a4');
                
                // --- COVER PAGE (ONLY ONCE) ---
                doc.setFontSize(16);
                doc.setFont("helvetica", "bold");
                doc.text("Assignment Submission", 105, 25, { align: "center" });
                
                let y = 45;
                const addField = (label, val) => {
                    doc.setFontSize(11);
                    doc.setFont("helvetica", "bold");
                    doc.text(label + ":", 20, y);
                    doc.setFont("helvetica", "normal");
                    // 85 is the x-coordinate for the value to align them
                    doc.text(val, 95, y);
                    y += 9; // Line height
                };

                addField("Student ID", data.studentId);
                addField("Student Full Name", data.studentName);
                addField("Academic Semester", data.semester);
                addField("Session", data.session);
                addField("Batch/Section", data.batch);
                addField("Email", data.email);
                addField("Department name", data.dept);
                addField("Faculty Name", data.faculty);
                addField("University name", data.university);
                
                y += 6; // extra spacing
                addField("Course No.", data.courseNo);
                addField("Course Title", data.courseTitle);
                addField("Course Credits", data.courseCredits);
                addField("Assignment No.", data.assignmentNo);
                addField("Google Form Submission Date", data.subDate);
                addField("Total Count of Students", data.totalStudents);
                addField("Total Count of Exercises", data.totalExercises);

                // Add Page Number
                doc.setFontSize(9);
                doc.text("Page " + doc.internal.getNumberOfPages(), 105, 285, { align: "center" });

                // --- CALCULATION BREAKDOWN PAGE ---
                doc.addPage();
                
                // Helper to print header on inner pages
                const printHeader = () => {
                    doc.setFontSize(9);
                    doc.setFont("helvetica", "normal");
                    doc.text(`ID: ${data.studentId}  |  Name: ${data.studentName}  |  Course: ${data.courseNo}`, 20, 15);
                    doc.line(20, 17, 190, 17);
                };
                
                printHeader();
                
                doc.setFontSize(14);
                doc.setFont("helvetica", "bold");
                doc.text("Mathematical Calculation Breakdown", 105, 30, { align: "center" });
                
                doc.setFontSize(10);
                doc.setFont("helvetica", "normal");
                doc.text(`Variables: Total Students (C) = ${data.totalStudents}, Total Questions (T) = ${data.totalExercises}`, 20, 45);
                
                doc.setFont("helvetica", "italic");
                doc.text("Formula: Qi = [ { (D*U + L + M) * H * E + i*C*B } mod T ] + 1", 20, 52);
                
                // Regenerate base math using current input fields to show explicitly
                const D_b = BigInt(document.getElementById('inputD').value);
                const L_b = BigInt(document.getElementById('inputL').value);
                const M_b = BigInt(document.getElementById('inputM').value);
                const B_b = BigInt(document.getElementById('inputB').value);
                const H_b = BigInt(document.getElementById('inputH').value);
                const U_b = BigInt(document.getElementById('inputU').value);
                const E_b = BigInt(document.getElementById('inputE').value);
                const C_b = BigInt(data.totalStudents);
                const T_b = BigInt(data.totalExercises);
                
                const baseCalculation = (D_b * U_b + L_b + M_b) * H_b * E_b;
                
                let bY = 65;
                doc.setFont("helvetica", "bold");
                doc.text("Base Calculation:", 20, bY);
                doc.setFont("helvetica", "normal");
                bY += 6;
                // Wrapping text if it's too long
                const baseStr = `(${D_b}*${U_b} + ${L_b} + ${M_b}) * ${H_b} * ${E_b} = ${baseCalculation}`;
                const splitBase = doc.splitTextToSize(baseStr, 170);
                doc.text(splitBase, 20, bY);
                bY += (splitBase.length * 6) + 6;
                
                for(let i = 1n; i <= 5n; i++) {
                    const iPart = i * C_b * B_b;
                    const totalSum = baseCalculation + iPart;
                    const modResult = totalSum % T_b;
                    const Qi = modResult + 1n;
                    
                    doc.setFont("helvetica", "bold");
                    doc.text(`Step i=${i}:`, 20, bY);
                    doc.setFont("helvetica", "normal");
                    bY += 6;
                    
                    const step1 = `[ { ${baseCalculation} + (${i}*${C_b}*${B_b}) } mod ${T_b} ] + 1`;
                    const splitStep1 = doc.splitTextToSize(step1, 170);
                    doc.text(splitStep1, 20, bY);
                    bY += (splitStep1.length * 6);
                    
                    const step2 = `-> [ ${totalSum} mod ${T_b} ] + 1`;
                    const splitStep2 = doc.splitTextToSize(step2, 170);
                    doc.text(splitStep2, 20, bY);
                    bY += (splitStep2.length * 6);
                    
                    doc.setFont("helvetica", "bold");
                    doc.text(`Result: Q${Qi}`, 20, bY);
                    bY += 10;
                }
                
                // Add Page Number
                doc.setFontSize(9);
                doc.setFont("helvetica", "normal");
                doc.text("Page " + doc.internal.getNumberOfPages(), 105, 285, { align: "center" });

                // --- QUESTIONS AND ANSWERS ---
                doc.addPage();
                printHeader();
                
                let currentY = 30; // Start Y position for first question
                
                for(let i = 0; i < globalAssignedQuestions.length; i++) {
                    const qNo = globalAssignedQuestions[i];
                    const qData = questionDataset[qNo.toString()] || { title: "N/A", answer: "N/A" };
                    
                    // Question block
                    doc.setFontSize(11);
                    doc.setFont("helvetica", "bold");
                    doc.text(`Question ${qNo}:`, 20, currentY);
                    
                    doc.setFont("helvetica", "normal");
                    const splitTitle = doc.splitTextToSize(qData.title, 170);
                    doc.text(splitTitle, 20, currentY + 6);
                    
                    currentY += (splitTitle.length * 6) + 8; // Adjust Y
                    
                    // Answer block
                    doc.setFont("helvetica", "bold");
                    doc.text("Answer:", 20, currentY);
                    
                    doc.setFont("helvetica", "normal");
                    const splitAns = doc.splitTextToSize(qData.answer, 170);
                    
                    // Check if answer will fit on this page, if not, move it to next page
                    // Rough estimate: each line is ~6 units.
                    if (currentY + (splitAns.length * 6) > 270) {
                        // Add page number to current page before breaking
                        doc.setFontSize(9);
                        doc.text("Page " + doc.internal.getNumberOfPages(), 105, 285, { align: "center" });
                        
                        doc.addPage();
                        printHeader();
                        currentY = 30;
                        
                        // Reprint Answer label on new page
                        doc.setFontSize(11);
                        doc.setFont("helvetica", "bold");
                        doc.text(`Answer (Cont. Q${qNo}):`, 20, currentY);
                        doc.setFont("helvetica", "normal");
                    }
                    
                    doc.text(splitAns, 20, currentY + 6);
                    
                    currentY += (splitAns.length * 6) + 16; // Extra space after answer for next question
                    
                    // Check if next question needs a new page
                    if (currentY > 255 && i < globalAssignedQuestions.length - 1) {
                        doc.setFontSize(9);
                        doc.text("Page " + doc.internal.getNumberOfPages(), 105, 285, { align: "center" });
                        
                        doc.addPage();
                        printHeader();
                        currentY = 30;
                    }
                }

                // Add Page Number to the very last page
                doc.setFontSize(9);
                doc.text("Page " + doc.internal.getNumberOfPages(), 105, 285, { align: "center" });

                // Determine Filename (Using raw ID to allow characters)
                const courseNumeric = data.courseNo.replace(/\D/g,'').slice(-3) || "000";
                const fileName = `${courseNumeric}_${data.studentId}_Assignment${data.assignmentNo}.pdf`;
                
                // Trigger download
                doc.save(fileName);
                
                closeModal();

            } catch (err) {
                console.error("Error generating PDF:", err);
                alert("There was an error generating the PDF. Please check the console.");
            } finally {
                // Restore button state
                btn.disabled = false;
                spinner.classList.add('hidden');
                btnText.innerText = 'Download PDF';
            }
        });
    </script>
</body>
</html>
